#!/bin/bash
set -e

echo "📦 Initializing..."

# Apply Terraform to create namespaces
echo "🔧 Creating namespaces via Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
cd ..

# Add Helm repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts || true
helm repo add grafana https://grafana.github.io/helm-charts || true
helm repo update

# Install Argo CD
kubectl create namespace argocd || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for Argo CD to be ready
echo "⏳ Waiting for Argo CD pods to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd

# Apply Argo CD applications for Tractus-X umbrella and standalone EDC
kubectl apply -f ci-cd/argo-cd/app-umbrella.yaml
kubectl apply -f ci-cd/argo-cd/app-edc.yaml

# Patch /etc/hosts for local DNS resolution
./patch-hosts.sh

echo "✅ All components deployed via Argo CD."
echo "🌐 Open https://localhost:8080 to access Argo CD."
