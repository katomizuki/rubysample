class AttendancesController < ApplicationController

  def new 
    @attendance = attendance
  end

   def create
    attendance = Attendance.new

    attendance.start_time = Time.now
    attendance.user_id = current_user.id
    @attendance = attendance
    if attendance.save
      redirect_to user_path, notice: "出社しました"
      @attendance = attendance
    end
  end

  def start
    user_id = current_user.id
    attendances = Attendance.where(user_id: user_id).select { |element| element.rest_start_time.nil? }
    if attendances.count > 0
       #binding.pry
    @attendance = attendances[0]

      if @attendance.update(rest_start_time: Time.now)
        redirect_to user_path, notice: "休憩入りました"
    end
  end
end

  def end
    user_id = current_user.id
    attendances = Attendance.where(user_id: user_id).select { |element| element.rest_end_time.nil? }
    if attendances.count > 0
    @attendance = attendances[0]

      if @attendance.update(rest_end_time: Time.now)
        redirect_to user_path, notice: "休憩から戻りました"
    end
  end
end


  def update
    user_id = current_user.id
    attendances = Attendance.where(user_id: user_id).select { |element| element.end_time.nil? }
    if attendances.count > 0
    @attendance = attendances[0]

      if @attendance.update(end_time: Time.now)
        redirect_to user_path, notice: "退勤しました"
    end
  end
end

  
  
end
