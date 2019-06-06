# Preview all emails at http://localhost:3000/rails/mailers/main_mailer
class MainMailerPreview < ActionMailer::Preview
  def order_created_preview
    MainMailer.order_created_email(Order.first.email, Order.first)
  end
end
