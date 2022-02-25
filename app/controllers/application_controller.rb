class ApplicationController < ActionController::Base
    include Pagy::Backend
    include Pundit
    
    rescue_from NotAuthorizedError, with: :user_not_authorized

    private  
    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer)
    end
end
