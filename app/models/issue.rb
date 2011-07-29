class Issue < ActiveRecord::Base
  
  has_many :bookings
  
  # Class
  def self.next
    order("COUNT( bookings.id ) DESC").first
  end
  
  
  # Instance
  def valid_dates
    if title.downcase=="issue 1"
      return [ (print_date-1.day).to_date, (print_date-2.days).to_date ]
    else
      return [ (print_date-2.days).to_date, (print_date-3.days).to_date ]
    end
  end
  
  
  
end
