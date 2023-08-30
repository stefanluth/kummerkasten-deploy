#!/bin/bash

echo "Generating passwords..."

UNLOCK_WORDS=3
DELETE_WORDS=6

UNLOCK_PASSWORD=$(python3 generate_passphrase.py $UNLOCK_WORDS)
DELETE_PASSWORD=$(python3 generate_passphrase.py $DELETE_WORDS)

echo "Sending mail..."

source ./.env
python3 send_mail.py $SMTP_SERVER $SMTP_PORT "$MAIL_SUBJECT" "$(
  cat <<EOM
Unlock password: $UNLOCK_PASSWORD
Delete password: $DELETE_PASSWORD
EOM
)" $MAIL_FROM $MAIL_TO $MAIL_USERNAME $MAIL_PASSWORD

echo "Starting container..."

docker run \
  -p '3000:3000' \
  -e UNLOCK_PASSWORD=$UNLOCK_PASSWORD \
  -e DELETE_PASSWORD=$DELETE_PASSWORD \
  ghcr.io/stefanluth/kummerkasten:latest
