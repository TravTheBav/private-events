class RsvpsController < ApplicationController
  def create
    if user_signed_in?
      @event = Event.find(params[:event_id])

      redirect_to event_path(@event), notice: "You have already attended this event" and return if currently_attending?

      current_user.attended_events << @event
      redirect_to root_path, notice: "rsvp successful!"
    else
      redirect_to new_user_session_path, alert: "You must be signed in to attend this event"
    end
  end

  private

  def currently_attending?
    current_user.attended_events.include?(@event)
  end
end
