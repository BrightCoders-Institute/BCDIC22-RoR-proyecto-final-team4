# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
	address:	'smtp.gmail.com',
	port:	  465,
	domain:	'gmail.com',
	user_name:		Rails.application.credentials.mailer.public_username, #gmail from the app
	password:		Rails.application.credentials.mailer.private_key, #password from that gmail
	authentication: 'plain',
	:ssl	=> true,
	:tsl	=> true,
	enable_starttsl_auto: true
}

