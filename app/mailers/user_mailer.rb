class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def send_email_to_sps(sp_delivery_details)
  	@sp_data = sp_delivery_details
  	# debugger
  	mail to: @sp_data[:email], subject: "Custom Filing"
  end
end
