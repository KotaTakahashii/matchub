class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :achievement, :image, :activeplace, :activeday, :instagram])
    end
    
    def after_sign_in_path_for(resource)
        user_path(current_user.id)
    end 
end
