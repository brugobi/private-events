class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authorized, only: %i[show edit update destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @prev_event = Event.previous_events
    @fut_event = Event.upcoming_events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    set_event
    @events = Event.all
  end

  def attend
    set_event
    user = current_user
    user.attendances.build(attended_event_id: @event.id).save
    flash[:notice] = "User #{user.username} added to attend #{@event.description}"
    redirect_to @event
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to '/welcome', notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:event_name, :description, :date)
  end
end
