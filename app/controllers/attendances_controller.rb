class AttendancesController < ApplicationController
  def index
    attendances = current_user.attendances
    json_response(attendances)
  end

  def create
    attendance = current_user.attendances.create!(attendance_params)
    json_response(attendance, :created)
  end

  private

  def attendance_params
    params.permit(:status)
  end
end
