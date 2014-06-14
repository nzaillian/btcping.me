class PriceNotificationMailer < ActionMailer::Base
  layout 'email'

  def notification(price_notification_id, current_price)
    @price_notification = PriceNotification.find(price_notification_id)
    @current_price = current_price

    mail(to: @price_notification.user.email, from: 'info@btcping.me', subject: "Bitcoin price alert")
  end
end