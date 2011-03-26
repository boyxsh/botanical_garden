class ApplicationController < ActionController::Base
  protect_from_forgery 


  def after_sign_in_path_for(resource_or_scope)
         if current_user.is_admin?
            return rails_admin_dashboard_path 
         else
            return home_index_path 
         end
     end
    
end
