class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :name, :date, :location, presence: true
end
