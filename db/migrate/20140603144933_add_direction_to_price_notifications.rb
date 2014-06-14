class AddDirectionToPriceNotifications < ActiveRecord::Migration
  def change
    add_column :price_notifications, :direction, :string
    add_index :price_notifications, :direction
  end
end
