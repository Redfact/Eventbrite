class EventsController < ApplicationController
  def new
  end

  def index
  	@events = Event.all
  	
  end

  def show
  	@event = Event.find(params[:id])
  end

  def create
  	puts "Controller Event create".colorize(:green)
  	hashdate= params[:event]
  	date = Date.strptime(hashdate[:start_date], '%Y-%m-%d')
  	@event=Event.create(start_date:date,
  		duration:params[:duration],
  		title:params[:title],
  		description:params[:description],
  		price:params[:price],
  		location:params[:location] ,
  		admin_id: current_user.id)
  	@state= @event
  	if @state
  		tp @event 
  		redirect_to root_path
  		puts "Event created".colorize(:green)
  	else
  		puts @event.errors.full_messages
  	end
  end
end
