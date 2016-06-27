class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  authorize_resource class: false
  layout "admin"

  def index
    @church = @user.church
    @members = @church.members
  end

  private

  def set_user
    @user = current_user
  end

end
