class RenameServiceExchange < ActiveRecord::Migration
  def change
    rename_column :price_notifications, :service, :exchange
  end
end
