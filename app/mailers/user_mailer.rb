class UserMailer < ActionMailer::Base
  default from: "support@classvantage.com"
  
  def reset_password_instructions(record, token, opts={})
    @token = token
    @user = record
    mail :to => @user.email, :subject => 'Password Reset'
  end
end
