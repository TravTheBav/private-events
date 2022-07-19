class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @event = current_user.created_events.create(event_params)
      render :show, status: :created
    else
      redirect_to new_user_session_path, alert: "You must be signed in to create an event"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event deleted"
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
