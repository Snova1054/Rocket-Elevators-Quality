class ApplicationController < ActionController::Base

    def require_admin
        # depending on your auth, something like...
        redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
    end

end
