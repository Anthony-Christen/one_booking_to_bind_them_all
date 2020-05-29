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
    if @service.save!
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :category, :price, :photo)
  end


  def edit
  end

  def update
  end
end
