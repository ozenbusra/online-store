class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def record_not_unique
    flash[:alert] = "It already exists."
    request.referrer ? (redirect_to request.referrer) : (redirect_to root_path)
  end
end
