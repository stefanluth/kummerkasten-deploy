FROM alpine/k8s:1.25.13
RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip

WORKDIR /deploy
COPY words.txt .
COPY generate_passphrase.py .
COPY send_telegram.py .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/deploy/entrypoint.sh"]
