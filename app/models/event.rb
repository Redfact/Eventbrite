class Event < ApplicationRecord
	has_many :participations
	has_many :users , through: :participations
	belongs_to :admin , class_name: "User"

		validates :start_date ,
			presence:true,
			if: :isEventNotPast 

		validates :duration , 
			presence:true,
			numericality: {greater_than: 0},
			if: :durationMultipleFive

		validates :title,
			presence:true,
			length:{in: 5..140}	

		validates :description,
			presence:true,
			length:{in: 20..1000}

		validates :price , 
			presence:true,
			numericality: {greater_than: 1,less_than: 1000}	

		validates :location , 
			presence:true



	def isEventNotPast()
		return start_date > Date.today
	end

	def durationMultipleFive()
		return (duration%5) == 0		
	end

end
