class EmailSubscriptionController < ApplicationController
  def subscribe
    email = params[:email]
    @error_message = nil

    if !email =~ Devise.email_regexp
      @error_message = "Invalid mail, please try again."
      return
    end

    if EmailSubscription.find_by_email(email)
      return
    end

    email_subscription = EmailSubscription.new
    email_subscription.email = email
    email_subscription.security_key = SecureRandom.hex(25)
    email_subscription.status = "pending"
    email_subscription.save

    #UserMailer.confirm_subscription_email(email_subscription).deliver_later
    MainMailer.email_subscribed_email(email_subscription).deliver
  end

  def confirm_subscription
    security_key = params[:security_key]

    email_subscription = EmailSubscription.find_by_security_key(security_key)

    @error_message = nil
    if !email_subscription
      @error_message = "Could not find your subscription."
      return
    end

    email_subscription.status = "confirmed"
    email_subscription.save

    MainMailer.email_confirmed_email(email_subscription).deliver
  end

  def unsubscribe
    security_key = params[:security_key]

    email_subscription = EmailSubscription.find_by_security_key(security_key)

    @error_message = nil
    if !email_subscription
      @error_message = "Could not find your subscription."
      return
    end

    email_subscription.status = "unsubscribed"
    email_subscription.save
  end
end