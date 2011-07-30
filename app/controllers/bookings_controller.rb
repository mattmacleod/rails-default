class BookingsController < ApplicationController
  
  def index
    @bookings = Booking.all.group_by{|b| b.performance.starts_at.to_date }.to_a.sort_by{|a|a[0]}
  end
  
  def check_writer
    @performance = Performance.find( params[:performance_id] )
    @writer = Writer.find( params[:writer_id] )    
    @booked_performances = @writer.bookings.booked_at( @performance.starts_at, @performance.ends_at ).map(&:performance)
    @before_performances = @writer.bookings.booked_at( @performance.starts_at-30.minutes, @performance.ends_at ).map(&:performance)
    @after_performances = @writer.bookings.booked_at( @performance.starts_at, @performance.ends_at + 30.minutes ).map(&:performance)
    render :partial => "check_writer"
  end
  
  
  def create
    @booking = Booking.new( params[:booking] )
    if @booking.save
      flash[:notice] = "Booking saved"
      redirect_to bookings_path and return
    else
      flash[:warning] = "Booking invalid!"
      redirect_to :back and return
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:notice] = "Booking destroyed"
    else
      flash[:warning] = "Could not destroy booking"
    end
    redirect_to :back
  end
  
end
