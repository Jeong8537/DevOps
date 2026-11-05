# 10주차: 쿠버네티스 배포와 서비스
## 주요 실행 명령어(배포)
---
```bash
#배포
kubectl apply -f k8s/deployment.yaml

#상태
kubectl get deployments
kubectl get replicasets
kubectl get pods

#삭제
kubectl delete -f k8s/
kubectl get all
```
## 주요 실행 명령어(스케일링)
```
#스케일링
kubectl scale deployment guestbook --replicas=4

#확인
kubectl get pods

```
