class Attendance < ApplicationRecord
  after_create :info_admin_send

  belongs_to :participant, class_name: "User"
  belongs_to :event

  def info_admin_send
    AttendanceMailer.reservation_admin_email(self).deliver_now
  end
end
