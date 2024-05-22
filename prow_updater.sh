#!/usr/bin/env bash

OLD_VERSION=v20221208-8898931a7f
VERSION=v20240517-ea10bd814

kubectl set image deployment/statusreconciler -n=prow statusreconciler=gcr.io/k8s-prow/status-reconciler:${VERSION}
kubectl wait --for=condition=ready pod -l app=statusreconciler -n prow 
kubectl rollout status deploy/statusreconciler -n prow

for NAME in crier deck ghproxy hook horologium prow-controller-manager sinker tide; do
kubectl set image deployment/${NAME} -n=prow ${NAME}=gcr.io/k8s-prow/${NAME}:${VERSION}
kubectl wait --for=condition=ready pod -l app=${NAME} -n prow 
kubectl rollout status deploy/${NAME} -n prow
kubectl rollout restart deploy/${NAME} -n prow
done
