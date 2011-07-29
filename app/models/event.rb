class Event < ActiveRecord::Base
  
  has_many :performances
    
  def update_schedule_status
    update_attribute :scheduled, !(performances.map(&:bookings).flatten.length==0)
  end
  
end
