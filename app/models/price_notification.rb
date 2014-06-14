class PriceNotification < ActiveRecord::Base
  include Common::Uuid

  extend FriendlyId

  friendly_id :uuid

  belongs_to :user

  symbolize :direction
  symbolize :exchange

  validates :exchange, presence: true
  validates :price, presence: true
  validates :direction, presence: true, inclusion: {in: [:below, :above]}

  def human_exchange_name
    self.class.exchange_human_names[exchange]
  end

  def self.exchange_human_names
    {
      bitstamp: 'Bitstamp.com',
      coinbase: 'Coinbase.com'
    }
  end
  
  def self.send_alerts!
    self.exchange_human_names.keys.map{ |exch| "::Exchange::#{exch.to_s.camelize}".constantize }.each do |exchange_klass|
      exchange = exchange_klass.new    
      price = exchange.current_price

      matching_notifications = where(
        "exchange = :exchange AND "\
        "((direction = :below AND price >= :price) OR "\
        "(direction = :above AND price <= :price)) AND "\
        "(last_notification_time IS NULL OR last_notification_time < :renotify_threshold)",
        exchange: exchange.name,
        below: :below,
        above: :above,
        price: exchange.current_price,
        renotify_threshold: 6.hours.ago
      )

      matching_notifications.each do |price_notificaton|
        PriceNotificationMailer.notification(price_notificaton.id, exchange.current_price).deliver
        price_notificaton.update!(last_notification_time: Time.now)
      end
    end
  end
end