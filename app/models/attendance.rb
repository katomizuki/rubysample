class Attendance < ApplicationRecord
  belongs_to :user

  ## 勤務中かどうか
  def is_working?
    !start_time.nil? && !is_rest? && !is_finished_work?
  end

  ## 休憩中かどうか
  def is_rest?
    !rest_start_time.nil? && rest_end_time.nil?
  end

  def is_finished_rest?
    !rest_end_time.nil?
  end

  ## その日を退勤しているかどうか
  def is_finished_work?
    !end_time.nil?
  end
end
