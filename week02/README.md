# 2추차: 실습 환경 구축과 버전 관리 기초

## 주요 실행 명령어
```bash
# WSL 배포판 확인 및 기본 설정
wsl -l -v
wsl --set-default Ubuntu-24.04

# 리눅스 파일 권한 설정 및 히스토리 재실행
chmod 750 script.sh
sudo !!
!ls

# Git 초기화, 커밋 및 원격 저장소 푸시
git init -b main
git add .
git commit -m "2주차: 실습 환경 구축 및 Git 기초"
gh repo create DevOps --public --source=. --remote origin --push
```
