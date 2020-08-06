class AttendancesController < ApplicationController
  before_action :set_attendee, only: %i[show edit update destroy create]
  # before_action :find_user

  # GET /attendees
  # GET /attendees.json
  def index
    @attendance = Attendance.all
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show; end

  # GET /attendees/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendees/1/edit
  def edit; end

  # POST /attendees
  # POST /attendees.json

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
