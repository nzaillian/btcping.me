class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :render_to_string, :sort_param, :page_param

  private

  def require_login
    unless current_user
      flash[:notice] = 'You need to be logged in to do what you are trying to do'
      redirect_to new_user_session_path(next: request.path) and return
    end
  end  

  def page_param
    params.permit(:page)[:page]
  end

  def id_param
    params.permit(:id)[:id]
  end  

  def sort_param
    params.permit(:sort)[:sort]
  end
end
