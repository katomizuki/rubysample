class UserDecorator < ApplicationDecorator
  delegate_all

  def end_job_button_disabled
    attendance = fetch_attendance()
    if attendance == nil 
      return true
    end
    if attendance.start_time.nil? && attendance.end_time.nil?
      return true
    else 
      return false
    end
  end

  def start_rest_button_disabled
    attendance = fetch_attendance()
    if attendance == nil 
      return true
    end
    if attendance.start_time.nil? && attendance.end_time.nil?
      return true
    elsif attendance.rest_start_time.nil? && !attendance.rest_end_time.nil?
      return true
    else 
      return false
    end
  end

  def start_job_button_disabled
    attendance = fetch_attendance()
    if attendance == nil 
      return true
    end
    if attendance.start_time.nil? && attendance.end_time.nil?
      return true
    else 
      return false
    end
  end

  def end_rest_button_disabled
    attendance = fetch_attendance()
    if attendance == nil 
      return true
    end
    if attendance.start_time.nil? && attendance.end_time.nil?
      return false
    elsif attendance.rest_start_time.nil? && !attendance.rest_end_time.nil?
      return true
    else 
      return false
    end
  end


  def work_status_alert_title
    attendance = fetch_attendance()
    if attendance.start_time.nil? && attendance.end_time.nil?
      return "勤務してないよ"
    elsif attendance.rest_start_time.nil? && !attendance.rest_end_time.nil?
      return "休憩中だよ"
    else 
      return "勤務中だよ"
    end
  end

  def fetch_attendance 
    user_id = object.id
    attendances = Attendance.where(user_id: user_id)
    attendance = attendances.last
    return attendance
  end
end
