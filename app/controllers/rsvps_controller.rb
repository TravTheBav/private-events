class RsvpsController < ApplicationController
  def create
    if user_signed_in?
      @event = Event.find(params[:event_id])
      current_user.attended_events << @event
      redirect_to root_path, notice: "rsvp successful!"
    else
      redirect_to new_user_session_path, alert: "You must be signed in to attend this event"
    end
  end
end
