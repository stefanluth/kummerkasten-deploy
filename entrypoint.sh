#!/bin/sh

echo "Starting entrypoint.sh"

echo "Generating passwords"
UNLOCK_PASSWORD=$(python3 generate_passphrase.py 3)
DELETE_PASSWORD=$(python3 generate_passphrase.py 6)

echo "Writing passwords to files"
echo $UNLOCK_PASSWORD >/shared/unlock.txt
echo $DELETE_PASSWORD >/shared/delete.txt

echo "Sending passwords via Telegram"
python3 send_telegram.py \
  --token $TELEGRAM_BOT_TOKEN \
  --user $TELEGRAM_USER_ID \
  --message "Unlock password: $UNLOCK_PASSWORD\nDelete password: $DELETE_PASSWORD"

if [ -z "$1" ]; then
  echo "No command provided, exiting"
  exit 0
fi

echo "Executing command: $@"
exec "$@"
