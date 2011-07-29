class Event < ActiveRecord::Base
  
  has_many :performances
  
  def find_booking
    
    # Pick an issue
    issue = Issue.next
    
    # Get the list of available dates
    dates = issue.valid_dates
    
    # Get all performances on those dates
    performances = performances.on( dates )

    # Based on whether this is a good show or not, pick
    # an available writer!
    writers = dates.find{ |d| Writer.available_on( d ) }
    
    # Create a new booking
    return Booking.new( 
      :issue => issue,
      :writer => 1
    )
    
  end
  
end
