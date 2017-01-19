class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_church
  authorize_resource class: false
  layout "admin"

  def index
    @members = @church.members
    @givings = @church.givings
    @monthly_givings = @church.givings.where(date_given: Time.now.beginning_of_month..Time.now.end_of_month)
    @giving_types = @church.giving_types
  end

  private

  def set_user
    @user = current_user
  end

  def set_church
    @church = current_user.church
  end

end
