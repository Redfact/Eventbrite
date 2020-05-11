class User < ApplicationRecord
	has_many :participations
	has_many :eventsParticipated , through: :participations , source: :event
	has_many :events
end
