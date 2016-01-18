class PagesController < ApplicationController
  def index
    @body_class = "home"
  end

  def about
    @body_class = "about"
  end

  def contact
    @body_class = "contact"
  end
end
