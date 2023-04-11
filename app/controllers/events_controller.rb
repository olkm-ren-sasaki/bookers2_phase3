class EventsController < ApplicationController
  def new
    @event = Event.new
    @group_id = params[:group_id]
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_comfirm_path(@event)
    else 
      render :new
    end

  end

  def comfirm
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :content, :group_id)
  end
end
