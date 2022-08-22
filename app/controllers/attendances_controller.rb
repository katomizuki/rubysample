class AttendancesController < ApplicationController

  def new 
    @attendance = attendance
  end

  def index 
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

def update

   time_type = params[:type]
   attendance = Attendance.find(params[:id])
   @attendance = attendance
   ## 退勤
   if time_type == "end"
    if @attendance.update(end_time: Time.now)
      redirect_to user_path, notice: "退勤しました"
    end
   end

   ##休憩時間開始
   if time_type == "rest_start"
      if @attendance.update(rest_start_time: Time.now)
        redirect_to user_path, notice: "休憩入りました"
    end
  end

   ##休憩時間終了
   if time_type == "rest_end"
      if @attendance.update(rest_end_time: Time.now)
        redirect_to user_path, notice: "休憩から戻りました"
    end
  end

end  


  
end
