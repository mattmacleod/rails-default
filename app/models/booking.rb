class Booking < ActiveRecord::Base
  belongs_to :performance
  belongs_to :writer
  belongs_to :issue
end
