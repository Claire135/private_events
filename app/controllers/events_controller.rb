class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

      if @event.save
        redirect_to @event, notice: "Event created successfully"
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
