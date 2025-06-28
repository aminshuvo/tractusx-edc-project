#!/bin/bash
IP=$(minikube ip)
HOSTS_LINE="$IP tractusx.local edc-standalone.local"

if grep -q "tractusx.local" /etc/hosts; then
  echo "⚠️ /etc/hosts already patched."
else
  echo "🔧 Patching /etc/hosts..."
  echo "$HOSTS_LINE" | sudo tee -a /etc/hosts
  echo "✅ Hosts patched."
fi
