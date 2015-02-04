require 'net/smtp'

$host         = "localhost"
$account      = "aiya000"
$password     = "hogehoge"

def smtp_debug(port, auth_type, use_tls)
	smtp = Net::SMTP.new($host, port)
	smtp.set_debug_output($stderr)
	smtp.enable_starttls() if use_tls

	p "port is [" + port.to_s + "]"
	p "auth type is [" + auth_type.to_s + "]"
	p "tls is [" + (use_tls ? "enabled" : "disabled") + "]"

	smtp.start($host, $account, $password, auth_type){|sender|}
rescue Net::SMTPUnsupportedCommand, Net::SMTPAuthenticationError,
       Net::SMTPSyntaxError, Errno::ECONNREFUSED, OpenSSL::SSL::SSLError
	p $!
end


[25, 465, 587].each{|port|
	[:plain, :login, :cram_md5].each{|auth_type|
		[true, false].each{|use_tls|
			smtp_debug(port, auth_type, use_tls)

			puts "\n#- - - - - - - - - - - - - - - - -#\n\n"
		}
	}
}
