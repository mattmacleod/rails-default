class WritersController < ApplicationController
  
  def index
    @writers = Writer.order(:name)
  end
  
  def show
    @writer = Writer.find( params[:id])
    @bookings = @writer.bookings.all.group_by{|b| b.performance.starts_at.to_date }.to_a.sort_by{|a|a[0]}
    
  end
  
  
end
