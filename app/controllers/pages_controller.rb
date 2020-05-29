class PagesController < ApplicationController
  def home
  @services = Service.all
  end

  def my_services
  end
end
