class Participation < ApplicationRecord
	belongs_to :user 
	belongs_to :event
	after_create :participation_confirm
	validates_uniqueness_of :event_id, :scope => :user_id

	def participation_confirm
		ParticipationMailer.participation_email(self).deliver_now
	end
end
