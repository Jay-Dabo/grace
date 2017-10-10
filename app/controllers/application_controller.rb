class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_church

  def after_sign_in_path_for(resource)
    current_church = current_user.church.id
    "/churches/#{current_church}"
  end

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html", status: 403, layout: "application"
  end

  private
    def set_church
      if current_user
        @church = current_user.church
      end
    end
end
