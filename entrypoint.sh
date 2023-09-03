#!/bin/sh

UNLOCK_PASSWORD=$(python3 generate_passphrase.py 3)
DELETE_PASSWORD=$(python3 generate_passphrase.py 6)

echo $UNLOCK_PASSWORD >/shared/unlock.txt
echo $DELETE_PASSWORD >/shared/delete.txt

python3 send_telegram.py \
  --token $TELEGRAM_BOT_TOKEN \
  --user $TELEGRAM_USER_ID \
  --message "Unlock password: $UNLOCK_PASSWORD\nDelete password: $DELETE_PASSWORD"

if [ -z "$1" ]; then
  exit 0
fi

exec "$@"
