# This controller handles operations related to bookings.
# Bookings represent certain objects within the system.
# It handles CRUD operations for bookings.
class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[edit update destroy]
  before_action :set_event

  def index
    # @bookings = Booking.where(author_id: current_user.id)
    @bookings = @event.bookings.where(author_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.except(:event_ids)) # Exclude event_ids from regular attributes
    @booking.event_ids = booking_params[:event_ids] # Assign event_ids separately

    @booking.author_id = current_user.id

    if @booking.save
      redirect_to event_bookings_path(@event), notice: 'Booking was successfully created.'
    else
      pp @booking.errors
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @booking = @event.bookings.find(params[:id])
  end

  def update
    # @booking.event_ids = booking_params[:event_ids] # Assign event_ids separately
    if @booking.update(booking_params)
      redirect_to event_bookings_path(@event), notice: 'Booking was successfully updated.'
    else
      pp @booking.errors
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    BookingEvent.where(booking_id: @booking.id).delete_all
    @booking.destroy
    redirect_to event_bookings_path(@event), notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find_by(id: params[:id], author_id: current_user.id)
    redirect_to event_bookings_path(@event), alert: 'Booking not found' if @booking.nil?
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :amount, event_ids: [])
  end
end
