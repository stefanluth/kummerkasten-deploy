import argparse
import smtplib


def send_email(server: str, port: int, subject: str, body: str, from_addr: str, to_addr: str, user: str, password: str):
    print(f"Connecting to {server}")
    server = smtplib.SMTP(server, port)
    print(f"Starting TLS")
    server.starttls()
    print(f"Logging in as {user}")
    server.login(user, password)
    print(f"Sending email")
    message = f"Subject: {subject}\n\n{body}"
    server.sendmail(from_addr, to_addr, message)
    print(f"Quitting")
    server.quit()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Send an email")
    parser.add_argument("server", help="SMTP server to use")
    parser.add_argument("port", help="SMTP port to use", type=int)
    parser.add_argument("subject", help="Subject of email")
    parser.add_argument("body", help="Body of email")
    parser.add_argument("from_addr", help="Who the email is from")
    parser.add_argument("to_addr", help="Who the email is to")
    parser.add_argument("user", help="Username for SMTP authentication")
    parser.add_argument("password", help="Password for SMTP authentication")
    args = parser.parse_args()

    send_email(args.server, args.port, args.subject, args.body, args.from_addr, args.to_addr, args.user, args.password)
