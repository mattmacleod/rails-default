class Booking < ActiveRecord::Base
  belongs_to :performance
  belongs_to :writer
  belongs_to :issue
  
  class << self
    def booked_at( start_time, end_time )
      includes(:performance).where("(starts_at <= ? AND ends_at >= ?)", end_time, start_time)
    end
  end

  after_save :update_schedule_status
  after_destroy :update_schedule_status
  
  private
  
  def update_schedule_status
    performance.event.update_schedule_status
  end
  
end
