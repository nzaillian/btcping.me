class PriceNotificationMailerPreview < ActionMailer::Preview
  def notification
    @price_notification = PriceNotification.last
    PriceNotificationMailer.notification(@price_notification, 80.0)
  end
end