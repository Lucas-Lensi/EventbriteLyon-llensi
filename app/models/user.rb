class User < ApplicationRecord
  after_create :welcome_send

  has_many :event_as_admins, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendance_as_participants, foreign_key: 'participant_id', class_name: "Attendance"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
