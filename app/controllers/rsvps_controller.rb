class RsvpsController < ApplicationController
  def create
    if user_signed_in?
      @event = Event.find(params[:id])
      current_user.attended_events << @event
      @event.attendees << current_user
      redirect_to root_path, notice: "rsvp successful!"
    else
      redirect_to new_user_session_path, alert: "You must be signed in to create an event"
    end
  end
end
