# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MentorMentored::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => :login,
    :charset => 'utf-8',
    :user_name => "hasan.uok@gmail.com",
    :password => "hassanalikhan"
}
