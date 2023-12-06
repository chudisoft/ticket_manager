# This controller handles operations related to Events.
# Events represent certain objects within the system.
# It handles CRUD operations for Events.
class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[edit update destroy]

  def index
    @events = current_user.events.includes(:bookings)

    @events = if params[:sort] == 'ancient'
                @events.order(created_at: :asc)
              else # if params[:sort] == 'recent'
                @events.order(created_at: :desc)
              end

    @event_booking_sums = {}
    @events.each do |event|
      @event_booking_sums[event.id] = event.bookings.sum(:amount)
    end
  end

  def new
    @event = current_user.events.build
  end

  def edit
    # Renders edit form for specific event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user == @event.user # Ensure the current user owns the event
      @event.bookings.destroy_all
      @event.destroy
      redirect_to events_path, notice: 'Event was successfully removed.'
    else
      redirect_to events_path, alert: "You don't have permission to remove this event."
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :icon)
  end
end
