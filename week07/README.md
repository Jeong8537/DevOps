# 7주차: 도커 컴포즈(Docker Compose)
## 주요 실행 명령어
```bash
# 컴포즈 YAML 문법 사전 검증
docker compose config --quiet && echo OK

# web 컨테이너 3개로 스케일 아웃 실행 및 상태 확인
docker compose up -d --scale web=3
docker compose ps

# 컨테이너 종료 (데이터 유지 vs 볼륨 삭제)
docker compose down
docker compose down -v
```
