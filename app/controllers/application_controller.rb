class ApplicationController < ActionController::Base
  protect_from_forgery 
  before_filter :admin_check
  
  def admin_check 
    if !current_user.blank? && !current_user.is_admin?
      redirect_to home_index_path if request.request_uri.include?("/admin")
    end
  end

  def user_login?
    if current_user.blank?
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.is_admin?
      return rails_admin_dashboard_path 
    else
      return home_index_path 
    end
  end
end
