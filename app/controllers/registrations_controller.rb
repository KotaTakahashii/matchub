class RegistrationsController < ApplicationController
    def after_sign_up_path_for(resource)
        user_path(current_user.id)
    end
end
