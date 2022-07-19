class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps

  def self.past
    Event.where("date < ?", Time.now)
  end

  def self.upcoming
    Event.where("date > ?", Time.now)
  end
end
