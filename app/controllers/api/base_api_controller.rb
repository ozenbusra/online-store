class Api::BaseApiController < ActionController::API
    include Pagy::Backend
    include Pundit::Authorization
    include PageSerializer
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private  
    def user_not_authorized
        render json: "You are not authorized to perform this action.", status: 401
        redirect_to root_path
    end
end
