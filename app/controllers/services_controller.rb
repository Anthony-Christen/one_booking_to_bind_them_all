class ServicesController < ApplicationController
  def index
    @services = Service.all
    @services = policy_scope(Service).order(created_at: :desc)
    authorize @services
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
    @service.save!
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :category, :price)
  end


  def edit
  end

  def update
  end
end
