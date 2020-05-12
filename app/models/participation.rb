class Participation < ApplicationRecord
	belongs_to :user 
	belongs_to :event
	after_create :participation_confirm

	def participation_confirm
		ParticipationMailer.participation_email(self).deliver_now
	end
end
