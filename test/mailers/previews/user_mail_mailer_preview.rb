# Preview all emails at http://localhost:3000/rails/mailers/user_mail_mailer
class UserMailMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mail_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailMailer.account_activation(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mail_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailMailer.password_reset(user)
  end
end