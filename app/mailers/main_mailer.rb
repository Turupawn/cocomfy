class MainMailer < ApplicationMailer
  default from: 'cocomfy.com <no-reply@cocomfy.com>'

  def is_a_valid_email?(email)
    #email_regex = %r{/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}xi # Case insensitive
    #(email =~ email_regex)
  end
  
  def order_created_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thanks for placing your order!').deliver
  end

  def admin_order_notification_email(order)
    @order = order
    mail(to: User.where(is_admin: true).first.email, subject: 'An order has been submitted!').deliver
  end

  def email_subscribed_email(email_subscription)
    @email = email_subscription.email
    @security_key = email_subscription.security_key

    @confirmation_link = "https://cocomfy.com/confirm_subscription?security_key=" + @security_key
    @unsubscribe_link = "https://cocomfy.com/unsubscribe?security_key=" + @security_key
    #if is_a_valid_email?(@email)
      mail(from: 'cocomfy.com <no-reply@cocomfy.com>', to: @email, subject: 'Please complete your cocomfy.com subscription by following this link')
    #end
  end

  def email_confirmed_email(email_subscription)
    @email = email_subscription.email
    @security_key = email_subscription.security_key

    @confirmation_link = "https://cocomfy.com/confirm_subscription?security_key=" + @security_key
    @unsubscribe_link = "https://cocomfy.com/unsubscribe?security_key=" + @security_key
    #if is_a_valid_email?(@email)
      mail(from: 'cocomfy.com <no-reply@cocomfy.com>', to: @email, subject: 'Welcome to cocomfy\'s subscription! Take this coupon as thanks on our part.')
    #end
  end
end
