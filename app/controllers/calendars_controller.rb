class CalendarsController < ApplicationController

  def show
    month_str = params[:month]
    month_date = Date.strptime(month_str, '%Y-%m')
    @month = month_date.month
    @year = month_date.year
    user_id = current_user.id 
    attencance = Attendance.find_by(user_id: user_id)
    @attendance = attencance
    @attendances = Attendance.where(user_id: user_id)  
  end
end
