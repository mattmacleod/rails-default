FestSchedule::Application.routes.draw do
  
  root :to => "welcome#index"
  
  get "/writers" => "writers#index", :as => :writers
  get "/writer/:id" => "writers#show", :as => :writer
  get "/writer/:id.pdf" => "writers#show", :as => :writer, :format => :pdf
  
  
  get "/events" => "events#index", :as => :events
  get "/event/:id" => "events#show", :as => :event
  post "/event/:id/toggle_image" => "events#toggle_image", :as => :event_toggle_image
  
  resource :bookings do |booking|
    member do
      put "toggle_submitted" => "bookings#toggle_submitted", :as => :toogle_submitted
    end
  end
  
end
