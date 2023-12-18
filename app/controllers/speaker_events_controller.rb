class SpeakerEventsController < ApplicationController
  before_action :set_speaker_event, only: %i[ show edit update destroy ]

  # GET /speaker_events or /speaker_events.json
  def index
    @speaker_events = SpeakerEvent.all
  end

  # GET /speaker_events/1 or /speaker_events/1.json
  def show
  end

  # GET /speaker_events/new
  def new
    @speaker_event = SpeakerEvent.new
  end

  # GET /speaker_events/1/edit
  def edit
  end

  # POST /speaker_events or /speaker_events.json
  def create
    @speaker_event = SpeakerEvent.new(speaker_event_params)

    respond_to do |format|
      if @speaker_event.save
        format.html { redirect_to speaker_event_url(@speaker_event), notice: "Speaker event was successfully created." }
        format.json { render :show, status: :created, location: @speaker_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speaker_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speaker_events/1 or /speaker_events/1.json
  def update
    respond_to do |format|
      if @speaker_event.update(speaker_event_params)
        format.html { redirect_to speaker_event_url(@speaker_event), notice: "Speaker event was successfully updated." }
        format.json { render :show, status: :ok, location: @speaker_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speaker_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speaker_events/1 or /speaker_events/1.json
  def destroy
    @speaker_event.destroy!

    respond_to do |format|
      format.html { redirect_to speaker_events_url, notice: "Speaker event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker_event
      @speaker_event = SpeakerEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def speaker_event_params
      params.fetch(:speaker_event, {})
    end
end
