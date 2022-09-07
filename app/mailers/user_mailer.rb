class UserMailer < ApplicationMailer
  default from: 'noreply@company.com'

  def welcome_email
    @user = params[:user]
    attachments.inline['image.jpg'] = File.read("#{Rails.root}/app/assets/images/revolt.jpg")
    mail(to: @user.email)
  end
end
