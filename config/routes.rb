FestSchedule::Application.routes.draw do
  
  root :to => "welcome#index"
  
  resources :writers
  
  get "/events" => "events#index", :as => :events
  get "/event/:id" => "events#show", :as => :event
  post "/event/:id/toggle_image" => "events#toggle_image", :as => :event_toggle_image
  
  resources :bookings do 
    member do
      put "toggle_submitted" => "bookings#toggle_submitted", :as => :toogle_submitted
    end
  end
  
end
