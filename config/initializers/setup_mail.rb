ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'app274008020@heroku.com',
  :password             =>  '5hh07fsp3680',
  :domain               =>  'heroku.com',
  :enable_starttls_auto  =>  true
}
