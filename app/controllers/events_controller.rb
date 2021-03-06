class EventsController < ApplicationController
  def new
  end

  def index
  	@events = Event.all
  	
  end

  def show
  	@event = Event.find(params[:id])
  	if(user_signed_in?)then
	  	@isMyevent = isMyevent?(@event.id)
	  	@alreadySuscribed = alreadySuscribed?(@event.id)
  	end
  end

  def create
	  	puts "Controller Event create".colorize(:green)
	  	@state = false
	  	hashdate= params[:event]
		date = Date.new
		if( !hashdate[:start_date].eql?("") )then date = Date.strptime(hashdate[:start_date],'%Y-%m-%d') end

	  	@event=Event.new(start_date:date,
	  		duration:params[:duration],
	  		title:params[:title],
	  		description:params[:description],
	  		price:params[:price],
	  		location:params[:location] ,
	  		admin_id: current_user.id)

		@state = @event.save
		  	if @state then # essaie de sauvegarder en base @gossip
		  		flash[:success] = "Votre event a été publié !"
		    	redirect_to  root_path
		  	else
		  		#Reaffiche la page 
		  		puts @event.errors.full_messages
		  		render :new
		    end
  	end

  	def isMyevent?(id)
  		return current_user.events.ids.include?(id)
  	end

  	def alreadySuscribed?(id)
  		return current_user.eventsParticipated.ids.include?(id)
  	end
end
