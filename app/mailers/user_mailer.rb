class UserMailer < ApplicationMailer
  default from: 'noreply@company.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email)
  end
end
