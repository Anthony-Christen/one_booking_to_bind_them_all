class PagesController < ApplicationController
  def home
  @services = Service.all.limit(6)
  end
end
