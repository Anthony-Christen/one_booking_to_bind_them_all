class PagesController < ApplicationController
  def home
  @services = Service.all.limit(6)
  end

  def my_services
  end
end
