class User < ActiveRecord::Base
  include Common::Uuid, Users::LoginAuthenticatable

  extend FriendlyId

  friendly_id :uuid, use: :slugged
  
  devise :database_authenticatable, :confirmable, :registerable, :recoverable, :validatable,
         authentication_keys: [:email]  

  has_many :price_notifications
end