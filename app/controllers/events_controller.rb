# This controller handles operations related to Events.
# Events represent certain objects within the system.
# It handles CRUD operations for Events.
class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index_Unauth, :show]
  before_action :set_event, only: %i[edit update destroy]

  def index_Unauth
    @events = Event.where(status: :active).includes(:bookings)

    if params[:sort] == 'ancient'
      @events = @events.order(created_at: :asc)
    else # if params[:sort] == 'recent'
      @events = @events.order(created_at: :desc)
    end

    @event_booking_sums = {}
    @events.each do |event|
      @event_booking_sums[event.id] = event.bookings.sum(:amount)
    end
  end

  def index
    if current_user.admin?
      @events = Event.all.includes(:bookings)
    else
      # @events = current_user.events.where(status: :blocked).includes(:bookings)
      @events = current_user.events.where(status != blocked).includes(:bookings)
    end

    if params[:sort] == 'ancient'
      @events = @events.order(created_at: :asc)
    else # if params[:sort] == 'recent'
      @events = @events.order(created_at: :desc)
    end

    @event_booking_sums = {}
    @events.each do |event|
      @event_booking_sums[event.id] = event.bookings.sum(:amount)
    end
  end

  def show
    @events = Event.find(params[:id])
  end

  def new
    # @event = current_user.events.build
    @event = Event.new(organizer_id: current_user.id)
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
    params.require(:event).permit(:title, :datetime, :venue, :details, :vip_price, :regular_price, :available_slot, :status, :organizer_id)
  end
end
