class AddParticipationRef < ActiveRecord::Migration[5.2]
  def change
  	add_reference :participations, :user, index: true
  	add_reference :participations, :event, index: true
  end
end
