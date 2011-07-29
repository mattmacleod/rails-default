class EventsController < ApplicationController
  
  def index
    unless params[:q].blank?
      @events = Event.order(:title).where(:title.matches => "%#{params[:q]}%")
    else
      @events = Event.limit(0)
    end
    render :partial => "list" and return if request.xhr?
  end
  
  def toggle_image
    @event = Event.find(params[:id])
    @event.toggle!(:has_pic)
    render :text => @event.has_pic?, :status => 200
  end
  
end
