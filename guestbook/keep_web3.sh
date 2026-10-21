#!/bin/bash

cd "$(dirname "$0")" || exit 1

TARGET_COUNT=${1:-3}
INTERVAL=5
LOG_FILE="watchdog.log"

if ! command -v docker >/dev/null 2>&1; then
	echo "오류: docker 명령어를 찾을 수 없습니다." >&2
	exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') [시작] web=${TARGET_COUNT} 유지 감시 시작 (PID: $$)" >> "$LOG_FILE"

while true; do
CURRENT_COUNT=$(docker compose ps --status running -q web 2>/dev/null | wc -l)

if [ "$CURRENT_COUNT" -ne "$TARGET_COUNT" ]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') [감지] 현재 running 상태 web: ${CURRENT_COUNT}개 (목표: ${TARGET_COUNT}개) -> 복구 실행" >> "$LOG_FILE"
	docker compose up -d --scale web="$TARGET_COUNT" >/dev/null 2>&1

	if [ $? -eq 0 ]; then
		echo "$(date '+%Y-%m-%d %H:%M:%S') [완료] web=${TARGET_COUNT} 상태로 정상 복구됨" >> "$LOG_FILE"
	else
		echo "$(date '+%Y-%m-%d %H:%M:%S') [실패] docker compose 복구 명령 실패" >> "$LOG_FILE"
	fi
fi
	sleep "$INTERVAL"
done
