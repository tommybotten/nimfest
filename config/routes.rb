Migrationtest::Application.routes.draw do
  resources :loads
  resources :slots
  resources :aircrafts
  resources :prices
  resources :jumpers
  resources :clubs
  resources :ratings
  resources :settlements
  get "/" => "loads#index"
end
