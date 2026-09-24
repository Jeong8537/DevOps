#!/bin/bash
cd "$(dirname "$0")" || exit 1
if ! command -v python3 >/dev/null 2>&1; then
	echo "pyton3! install!" >&2
	exit 1
fi
export WEB_PORT="8080"
export MODEL="qwen3:4b"
exec ./start.sh
