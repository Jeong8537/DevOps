#6주차: 도커파일(Dockerfile)과 이미지 배포
## 주요 실행 명령어
```bash
# Dockerfile 빌드 및 GHCR 로그인/푸시
docker build -t guestbook:v1 .
gh auth token | docker login ghcr.io -u Jeong8537 --password-stdin
docker tag guestbook:v1 ghcr.io/jeong8537/guestbook:v1
docker push ghcr.io/jeong8537/guestbook:v1

# 멀티 아키텍처 빌드 및 푸시
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/jeong8537/guestbook:v1 --push .
```
