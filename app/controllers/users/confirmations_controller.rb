class Users::ConfirmationsController < Devise::ConfirmationsController
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)

    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end  

  def resource_params
    params[:user].present? ? params.require(:user).permit(:email, :login, :password,
    :password_confirmation, :reset_password_token) : {}
  end    
end