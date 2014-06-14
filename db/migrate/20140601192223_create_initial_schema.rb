class CreateInitialSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :slug

      # Database authenticatable
      t.string :username
      t.string :email,              :null => false, :default => ""


      ## DEVISE COLUMNS
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token

      ## END DEVISE COLUMNS

      t.string :first_name
      t.string :last_name

      t.string :role

      t.string :nickname

      t.boolean :canceled

      t.string :avatar

      t.boolean :active
      t.boolean :account_on_hold

      t.string :time_zone

      t.timestamps
    end
    add_index :users, :uuid
    add_index :users, :slug
    add_index :users, :email
    add_index :users, :role

    create_table :price_notifications do |t|
      t.integer :user_id
      t.string :service
      t.decimal :price, precision: 8, scale: 2
      t.decimal :last_notification_price, precision: 8, scale: 2
      t.datetime :last_notification_time
      t.timestamps
    end

    add_index :price_notifications, :user_id
    add_index :price_notifications, :price
    add_index :price_notifications, :last_notification_time
    add_index :price_notifications, :service
  end
end
