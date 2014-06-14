class Users::RegistrationsController < ::Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  
  def new
    build_resource({})
    respond_with self.resource
  end  

  # POST /resource
  def create
    self.resource = build_resource(sign_up_params)

    if resource.save

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        if params[:next].present?
          redirect_to(params[:next]) and return
        else
          redirect_to(root_path) and return
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def sign_up_params
    params.require(:user).permit(:username, :nickname, :email, :first_name, :last_name, :password, 
      :password_confirmation)
  end
end
