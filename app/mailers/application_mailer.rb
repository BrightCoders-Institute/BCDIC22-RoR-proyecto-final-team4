class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailer.public_username
  layout "mailer"
end
