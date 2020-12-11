class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    before_action :set_global_user
    

    def set_global_user
        if current_user
            @user = current_user
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :credits])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :credits])
    end


end
