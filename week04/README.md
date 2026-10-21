# 4주차: 자동화와 협업 & 네트워크
## 주요 실행 명령어
```bash
# 로그 필터링 및 디렉터리 백업/복원 검증
grep -R "ERROR" server.log 2>/dev/null | wc -l
tar -czf backups/backup.tar.gz test
tar -xzf backups/backup.tar.gz -C restore-check
diff -rq test restore-check/test

# 네트워크 포트 점검 및 프로세스 강제 종료
ss -tlnp | grep 8080
kill <PID>

# Git PR 생성 및 충돌 해결 후 병합
gh pr create --title "feat: 백업 스크립트 추가" --body "백업 기능 구현" --base main
git fetch origin && git merge origin/main
gh pr merge --squash --delete-branch
```
