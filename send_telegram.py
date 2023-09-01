import urllib.request
import urllib.parse
import argparse


def main(token, user_id, message):
    url = f"https://api.telegram.org/bot{token}/sendMessage"
    data = urllib.parse.urlencode({"chat_id": user_id, "text": message}).encode("utf-8")
    req = urllib.request.Request(url, data)
    urllib.request.urlopen(req)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Send a Telegram message.")
    parser.add_argument("--token", required=True, help="Bot API token")
    parser.add_argument("--user", required=True, help="User ID")
    parser.add_argument("--message", required=True, help="Message string")

    args = parser.parse_args()

    main(args.token, args.user, args.message)
