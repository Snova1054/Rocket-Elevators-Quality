class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    def require_admin
        redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
    end

    def after_sign_in_path_for(resource_or_scope)
        "https://www.rocket-elevators.xyz/"
    end

    def after_sign_out_path_for(resource_or_scope)
        "https://www.rocket-elevators.xyz/"
    end
end
