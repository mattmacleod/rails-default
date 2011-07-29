module ApplicationHelper
  
  def flash_message
    return unless flash
    return [:warning, :notice].map do |flash_type|
      unless flash[flash_type].blank?
      	"<div class=\"flash_wrapper\"><div class=\"flash flash_#{flash_type}\">#{flash[flash_type]}</div></div>"
      end 
    end.join.html_safe
  end
  
end
