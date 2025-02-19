import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

class EmailNotifier:
    """
    A class for sending emails using an SMTP server.
    """

    def __init__(self, sender_email, sender_password, smtp_server="smtp.gmail.com", smtp_port=587):
        """
        EmailNotifier
        smtp_server: SMTP server address
        smtp_port: SMTP server port
        sender_email: Email address of the sender
        sender_password: Password or app-specific password for the sender's email account
        """
        self.smtp_server = smtp_server
        self.smtp_port = smtp_port
        self.sender_email = sender_email
        self.sender_password = sender_password

    def send_email(self, recipient_email, subject, body):
        """
        Send an email to a recipient.
        recipient_email: Recipient's email address
        ubject: Subject of the email
        param body: Body of the email
        """
        try:
            # Create the email
            msg = MIMEMultipart()
            msg['From'] = self.sender_email
            msg['To'] = recipient_email
            msg['Subject'] = subject
            
            # Attach the email body
            msg.attach(MIMEText(body, 'plain'))

            # Connect to the SMTP server
            server = smtplib.SMTP(self.smtp_server, self.smtp_port)
            server.starttls()  # Upgrade to a secure connection
            
            # Log in to the email account
            server.login(self.sender_email, self.sender_password)
            
            # Send the email
            server.send_message(msg)
            print(f"Email sent successfully to {recipient_email}.")
            
            # Close the server connection
            server.quit()

        except Exception as e:
            print(f"Failed to send email: {e}")