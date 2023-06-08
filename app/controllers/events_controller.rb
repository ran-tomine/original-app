class EventsController < ApplicationController

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  
end


private

def event_params
  params.require(:event).permit(:name,:location ,:datetime, :description, :image).merge(user_id: current_user.id)
end

end
