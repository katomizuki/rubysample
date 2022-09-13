class UserDecorator < ApplicationDecorator
  delegate_all

  def end_job_button_disabled
    title = work_status_alert_title()
    if title == "勤務中だよ"
      return false
    end
    return true
  end

  def start_rest_button_disabled
    title = work_status_alert_title()
    if title == "勤務中だよ"
      return false
    end
      return true
  end

  def start_job_button_disabled
    title = work_status_alert_title()
    if title == "勤務してないよ"
      return false
    end
      return true
  end

  def end_rest_button_disabled
    title = work_status_alert_title()
    if title == "休憩中だよ"
      return false
    end
      return true
  end


  def work_status_alert_title
    attendance = fetch_attendance()
    if attendance.nil? || (!attendance.start_time.nil? && !attendance.end_time.nil?) || (attendance.start_time.nil? && attendance.end_time.nil?)
      return "勤務してないよ"
    end

    if !attendance.rest_start_time.nil? && attendance.rest_end_time.nil?
      return "休憩中だよ"
    end 

      return "勤務中だよ"
  end

  def fetch_attendance 
    user_id = object.id
    attendances = Attendance.where(user_id: user_id)
    attendance = attendances.last
    return attendance
  end
end
