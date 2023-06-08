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

def show
  @event = Event.find(params[:id])
end

def edit
end

def update
end



private

def event_params
  params.require(:event).permit(:name,:location ,:datetime, :description, :image).merge(user_id: current_user.id)
end

end
