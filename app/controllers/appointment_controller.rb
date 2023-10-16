class AppointmentController < ApplicationController

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user = @user
    if appointment.save 
      render json: {data: appointment}
    end
  end

  def show
    appointment = Appointment.find_by(id: params[:id], user: @user)
  end
  
  def update
    appointment = Appointment.find_by(id: params[:id], user: @user)
    if appointment.update(appointment_params) 
      render json: {data: appointment}
    end
  end
  
  def list
    appointments = Appointment.where(user: @user)
    render json: appointments
  end

  private

  def appointment_params
    params.permit(:description, :created_by, :start_location, :end_location, :start_date, :end_date)
  end
  
end
