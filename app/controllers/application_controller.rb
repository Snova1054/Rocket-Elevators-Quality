class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception  
    skip_before_action :verify_authenticity_token
    
    def require_admin
        redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
    end

    def after_sign_in_path_for(resource_or_scope)
        puts("hello")
    end

    def after_sign_out_path_for(resource_or_scope)
        puts("hello")
    end
end
