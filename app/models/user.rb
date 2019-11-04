class User < ApplicationRecord
  has_many :event_as_admins, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendance_as_participants, foreign_key: 'participant_id', class_name: "Attendance"
end
