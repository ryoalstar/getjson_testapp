Rails.application.routes.draw do
  root :to => 'requests#index'
  resources :requests
  post 'requests/parse_json', :to => 'requests#parse_json'
end
