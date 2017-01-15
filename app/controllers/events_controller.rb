class EventsController < ApplicationController
  def create
    e = Event.new(event_params)
    e.user = current_user
    e.save
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:body)
  end
end
