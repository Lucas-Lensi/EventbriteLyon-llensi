class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :is_future?
  validates :duration, presence: true, numericality: {greater_than: 0}
  validate :is_multiple_of_5?
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, inclusion: {in: 1..1000}
  validates :location, presence: true
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :participants, through: :attendances

  def is_future?
    self.start_date > Date.today
#    if start_date < Date.today
#      errors.add(:start_date, "can't be in the past")
#    end
  end

  def is_multiple_of_5?
    self.duration % 5 == 0
#    unless duration % 5 == 0
#      errors.add(:duration, "can't be in the past")
#    end
  end
end
