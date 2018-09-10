class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :set_church
  #after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    current_church = current_user.church.id
    "/churches/#{current_church}"
  end

  private
    def set_church
      if current_user
        @church = current_user.church
      end
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def authorize_church?
      authorize @church, :nested_resources?
    end

end
