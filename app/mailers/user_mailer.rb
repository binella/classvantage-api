class UserMailer < ActionMailer::Base
  default from: "support@classvantage.com"
  
  def reset_password_instructions(record, token, opts={})
    @token = token
    @user = record
    mail :to => @user.email, :subject => 'Password Reset'
  end
  
  def welcome_email(user) 
    @user = user
    mail :to => @user.email, :subject => 'Welcome to ClassVantage'
  end
  
  def agenda_items_email(student, agenda_item_ids, note, span)
    @emails = student.parent_emails.where(:unsubscribed => [false,nil])
    return if @emails.empty?
    @student = student
    @agenda_items = AgendaItem.where(:id => agenda_item_ids, :page_id => @student.page_ids)
    @note = note
    @span = span
    mail :to => @emails.map(&:email_address), :subject => "#{student.full_name}'s upcoming agenda items"
  end
  
end
