class Users::SessionsController < ::Devise::SessionsController
  skip_before_filter :require_no_authentication
  
  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end  

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    flash[:notice] = "You have signed in successfully"
    
    if params[:next].present?
      redirect_to params[:next]
    else
      redirect_to root_path
    end
  end  

  def sign_in_params
    params[:user].present? ? params.require(:user).permit(:username, :email, :first_name, :last_name, :password) : {}
  end  
end
