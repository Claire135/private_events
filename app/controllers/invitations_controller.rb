class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    invitation = event.invitations.build(attendee: current_user)

    if invitation.save
      redirect_to event, notice: "You've successfully signed up to attend #{event.name}!"
    else
      redirect_to event, alert: "Could not register attendence"
    end
  end

  def destroy
      invitation = current_user.invitations.find_by(event_id: params[:event_id], attendee: current_user)

    if invitation
      invitation.destroy
      redirect_to event_path(params[:event_id]), notice: "You are no longer attending this event."
    else
      redirect_to event_path(params[:event_id]), alert: "You weren't attending this event in the first place."
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees
  end

  def show
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find(params[:id])
  end
end
