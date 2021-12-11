class ApplicationController < ActionController::Base
    
    def require_admin
        redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
    end

end
