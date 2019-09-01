class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update, :destroy]

  def index
    attendances = current_user.attendances
    json_response(attendances)
  end

  def create
    attendance = current_user.attendances.create!(attendance_params)
    json_response(attendance, :created)
  end

  def update
    @attendance.update(attendance_params)
    head :no_content
  end

  def destroy
    @attendance.destroy
    head :no_content
  end

  private

  def attendance_params
    params.permit(:id, :status)
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end
end
