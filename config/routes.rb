Rails.application.routes.draw do
  resources :visitor_statistics, only: :index
  resources :visits do
  	resources :pageviews	
  end
end
