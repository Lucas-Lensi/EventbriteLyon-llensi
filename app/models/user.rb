class User < ApplicationRecord
  #after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances, foreign_key: 'participant_id', class_name: "Attendance"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
