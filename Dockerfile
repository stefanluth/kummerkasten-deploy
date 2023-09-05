FROM python:3.10

WORKDIR /deploy
COPY words.txt .
COPY generate_passphrase.py .
COPY send_telegram.py .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/deploy/entrypoint.sh"]
