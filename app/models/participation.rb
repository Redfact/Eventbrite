class Participation < ApplicationRecord

	after_create :participation_confirm

	def participation_confirm(user)
		ParticipationMailer.participation_email(self).deliver_now
	end
end
