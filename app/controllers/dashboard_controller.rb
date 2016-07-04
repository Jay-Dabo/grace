class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_church
  authorize_resource class: false
  layout "admin"

  def index
    @members = @church.members
  end

  private

  def set_user
    @user = current_user
  end

  def set_church
    @church = current_user.church
  end

end
