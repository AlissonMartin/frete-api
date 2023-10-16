class Appointment < ApplicationRecord
  belongs_to :user
  validates :start_date, presence: true
  validates :start_location, presence: true
  validates :user, presence: true
  
end
