#!/bin/bash

echo "Generating passwords..."

UNLOCK_PASSWORD=$(python3 generate_passphrase.py 3)
DELETE_PASSWORD=$(python3 generate_passphrase.py 6)

echo "Sending Telegram message..."

source ./.env
python3 send_telegram.py \
  --token $TELEGRAM_BOT_TOKEN \
  --user $TELEGRAM_USER_ID \
  --message "Unlock password: $UNLOCK_PASSWORD\nDelete password: $DELETE_PASSWORD"

echo "Starting container..."

docker run \
  -p '3000:3000' \
  -e UNLOCK_PASSWORD=$UNLOCK_PASSWORD \
  -e DELETE_PASSWORD=$DELETE_PASSWORD \
  ghcr.io/stefanluth/kummerkasten:latest
