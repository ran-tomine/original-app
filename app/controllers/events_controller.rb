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
  @event_comment = EventComment.new
  @event_comments =@event.event_comments.includes(:user)
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update(event_params)
    redirect_to event_path
  else
    render :edit
  end
end

def destroy
  event = Event.find(params[:id])
  event.destroy
  redirect_to root_path
end



private

def event_params
  params.require(:event).permit(:name,:location ,:datetime, :description, :image, :address, :latitude, :longitude).merge(user_id: current_user.id)
end

end
