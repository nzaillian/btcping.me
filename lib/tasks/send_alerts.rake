task send_alerts: :environment do
  PriceNotification.send_alerts!
end