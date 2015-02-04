require 'net/smtp'


SMTP_SERVER       = "smtp.gmail.com"
SMTP_PORT         = 587
HOST              = "gmail.com"
NAME              = "your_name"
PASSWORD          = "account_password"
FROM_MAIL_ADDRESS = "your_name@gmail.com"
TO_MAIL_ADDRESS   = "hoge@foo.jp"



message = <<EOM
From: test by ruby <your_name@gmail.com>
To: receiver <hoge@foo.jp>
Subject: test
test
EOM

smtp = Net::SMTP.new(SMTP_SERVER, SMTP_PORT)
smtp.set_debug_output($stderr)
smtp.enable_starttls()

smtp.start(HOST, NAME, PASSWORD, :login){|sender|
	sender.sendmail(message, FROM_MAIL_ADDRESS, TO_MAIL_ADDRESS)
}

puts "Succeed"
