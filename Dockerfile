FROM alpine/k8s:1.25.13
RUN apk update
RUN apk upgrade
RUN apk add --no-cache curl python3 py3-pip
RUN pip3 install --upgrade pip
WORKDIR /deploy
COPY words.txt .
COPY generate_passphrase.py .
COPY send_telegram.py .
COPY deploy.sh .

CMD ["/bin/sh", "-c"]
