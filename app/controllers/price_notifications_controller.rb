class PriceNotificationsController < ApplicationController
  before_filter :require_login

  before_filter :find_and_authorize_price_notification, only: [:edit, :update, :destroy]

  handles_sortable_columns

  def index
    if sort_param.blank?
      flash.keep
      redirect_to(price_notifications_path(sort: 'created_at')) and return
    end

    @price_notifications = current_user.price_notifications.order(sort_order).page(page_param)
  end
  
  def new
    @price_notification = PriceNotification.new(price_notification_params)
  end

  def create
    @price_notification = current_user.price_notifications.new(price_notification_params)

    if @price_notification.save
      redirect_to price_notifications_path, flash: {notice: "Your notification was successfully added"}
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @price_notification.update(price_notification_params)
      redirect_to edit_price_notification_path(@price_notification), flash: {notice: 'Price notification successfully updated'}
    else
      render :edit
    end
  end

  def destroy
    @price_notification.destroy

    redirect_to price_notifications_path, flash: {alert: 'Your notification was successfully deleted'}
  end

  private

  def price_notification_params
    params.permit(price_notification: [:exchange, :price, :direction])[:price_notification]
  end

  def sort_order
    sortable_column_order || 'created_at DESC'
  end

  def find_and_authorize_price_notification
    @price_notification = PriceNotification.friendly.find(id_param)
    authorize! :modify, @price_notification
  end
end