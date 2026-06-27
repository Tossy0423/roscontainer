#!/bin/bash
set -euox pipefail
trap 'echo "エラーを検知しました: $BASH_COMMAND"; exit 1' ERR

current_time=$(date "+%Y/%m/%d %H:%M:%S")
current_filename=$(basename "$0")

SRC_FILE='/workspace/.bashrc'
DST_FILE='/home/ubuntu/.bashrc'

if ! cmp -s "$SRC_FILE" "$DST_FILE"; then
  cp "$SRC_FILE" "$DST_FILE"
  chmod 644 "$DST_FILE"
  echo "[${current_time}][INFO]: ${DST_FILE}を更新"
else
  echo "[${current_time}][INFO]: 更新処理なし"
fi
