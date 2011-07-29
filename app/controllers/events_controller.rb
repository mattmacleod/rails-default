class EventsController < ApplicationController
  
  def index
    unless params[:q].blank?
      @events = Event.order(:title).where(:title.matches => "%#{params[:q]}%")
    else
      @events = Event.limit(0)
    end
    render :partial => "list" and return if request.xhr?
  end
  
end
