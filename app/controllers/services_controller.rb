class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
  end

  def new
    @service = Service.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
