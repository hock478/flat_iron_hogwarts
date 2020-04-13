class ApplicationController < ActionController::Base
    # before_action :set_current_user

  

    def set_current_user
        if session[:user_id]
            @current = User.find(session[:user_id])
        else 
            @current = nil
        end
        @current
    end
end
