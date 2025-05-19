class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }

  belongs_to :creator, class_name: "User"

  has_many :invitations, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  validates :name, :date, :location, presence: true

  def no_of_attendees
    attendees.count
  end

  # as a class methods - replaced by scope - left for educational purposes
  # def self.past
  #  where("date < ?", Date.today)
  # end

  # def self.upcoming
  #  where("date > ?", Date.today)
  # end

  # def self.this_month
  #  where(date: Date.today.beginning_of_month..Date.today.end_of_month)
  # end
end
