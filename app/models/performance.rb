class Performance < ActiveRecord::Base
  
  belongs_to :event
  has_many :bookings
  
end
