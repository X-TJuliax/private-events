class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id, class_name: 'Attendance'
  has_many :attended_events, through: :attendances, source: :attended_event
end
