class UsersController < ApplicationController
  before_filter :find_and_authorize_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), flash: {notice: 'Account successfully updated'}
    else
      render :edit
    end
  end

  private

  def find_and_authorize_user
    @user = User.friendly.find(id_param)
    authorize! :modify, @user
  end

  def user_params
    params.permit(user: [:email])[:user]
  end
end