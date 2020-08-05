class AttendancesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy, :create]
  # before_action :find_user

  # GET /attendees
  # GET /attendees.json
  def index
    @attendance = Attendance.all
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  # POST /attendees.json
  def create
    event = params[:attended_event_id]
    @attendance = current_user.attendances.build(attended_event_id: event)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendee was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :show }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendee was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendance_url, notice: 'Attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendee = Attendee.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def attendance_params
    params.fetch(:attendance, {})
  end
end
