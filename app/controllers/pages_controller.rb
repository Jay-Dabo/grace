class PagesController < ApplicationController
  before_action :set_church
  def index
    @body_class = "home"
  end

  def about
    @body_class = "about"
  end

  def contact
    @body_class = "contact"
  end

  def pricing
    @body_class = "pricing"
  end

  private

    def set_church
      if current_user
        @church = current_user.church
      end
    end
end
