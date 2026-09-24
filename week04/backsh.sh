#!/bin/bash

#==========
#
#backup script
#사용법: ./backsh.sh [백업할_폴더]
#
#==========

cd "$(dirname "$0")" || exit 1

SOURCE_DIR=${1:-test}
BACKUP_DIR="backups"
TODAY=$(date +%Y%m%d_%H%M%S)
FILENAME="${TODAY}_$$.tar.gz"

# 원본 확인

if [ ! -d "$SOURCE_DIR" ]; then
    echo "오류: '$SOURCE_DIR' 디렉터리가 없습니다."
    exit 1
fi

# 백업 폴더 준비

mkdir -p "$BACKUP_DIR" || exit 1

# 압축

echo "백업 시작: $SOURCE_DIR -> $BACKUP_DIR/$FILENAME"
tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"

# 결과 확인

if [ $? -eq 0 ]; then
    SIZE=$(du -sh "$BACKUP_DIR/$FILENAME" | cut -f1)
    echo "백업 완료! (size: $SIZE)"
else
    echo "백업 실패!"
    exit 1
fi

# 목록
echo "현재 보관 중인 백업:"
ls -l "$BACKUP_DIR"

