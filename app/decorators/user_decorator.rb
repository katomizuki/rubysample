class UserDecorator < ApplicationDecorator
  delegate_all

  def end_job_button_disabled
    attendance = fetch_attendance()
    if attendance.is_finished_work?
      return true
    end
    if attendance.is_working?
      return false
    end
    return true
  end

  def start_rest_button_disabled
    attendance = fetch_attendance()
    if attendance.is_finished_work?
      return true
    end
    if attendance.is_rest?
      return false
    end
      return true
  end

  def start_job_button_disabled
    attendance = fetch_attendance()
    if attendance.is_finished_work?
      return true
    end
    if attendance.is_working? || attendance.is_rest?
      return true
    end
      return false
  end

  def end_rest_button_disabled
     attendance = fetch_attendance()
     if attendance.is_finished_work?
      return true
    end
    if attendance.is_rest?
      return false
    end
      return true
  end


  def work_status_alert_title
    attendance = fetch_attendance()
    if attendance.is_working?
      return "勤務中だよ"
    end

    if attendance.is_rest?
      return "休憩中だよ"
    end 
      return "勤務終了"
  end

  def fetch_attendance 
    user_id = object.id
    attendances = Attendance.where(user_id: user_id)
    attendance = attendances.last
    return attendance
  end
end
