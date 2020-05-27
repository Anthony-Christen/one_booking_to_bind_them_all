class BookingsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to service_path(@service)
    else
      @booking = Booking.new
      render "services/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :statut, :duration, :service_id, :user_id)
  end


end
