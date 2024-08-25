class Event < ApplicationRecord
    belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
    has_many :attendances, foreign_key: :attended_event_id, class_name: 'Attendance'
    has_many :attendees, through: :attendances, source: :attendee 
    scope :past, ->{ where('date < ?', Date.today)}
    scope :upcoming, -> { where('date >= ?', Date.today) }

    def self.past(user)
        user.attended_events.where('date < ?', Date.today)
    end



    def self.upcoming(user)
        user.attended_events.where('date > ?', Date.today)
    end
end
