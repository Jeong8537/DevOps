#5주차: 도커(Docker) w/ GitHub Issue
## 주요 실행 명령어
```bash
# nginx 다중 컨테이너 실행 및 내부 파일 수정 실습
docker run -d -p 8091:80 --name nginx1 nginx
docker run -d -p 8092:80 --name nginx2 nginx
docker run -d -p 8093:80 --name nginx3 nginx
docker exec -it nginx1 bash -c 'echo "<h1>Welcome to nginx1</h1>" > /usr/share/nginx/html/index.html'

# 컨테이너 상태/로그 확인 및 정리
docker ps -a
docker logs -f nginx1
docker rm -f nginx1 nginx2 nginx3

# 볼륨 마운트(-v)를 이용한 파이썬 버전별 일회성 실행
docker run --rm -v "$PWD:/app" -w /app python:3.12-slim python test.py
```
