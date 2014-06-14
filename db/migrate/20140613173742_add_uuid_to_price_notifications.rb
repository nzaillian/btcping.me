class AddUuidToPriceNotifications < ActiveRecord::Migration
  def change
    add_column :price_notifications, :uuid, :string
    add_index :price_notifications, :uuid
  end
end
