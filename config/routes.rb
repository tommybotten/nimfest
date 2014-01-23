Migrationtest::Application.routes.draw do
  resources :loads
  resources :slots
  resources :aircrafts
  resources :prices
  resources :jumpers
  resources :clubs
  resources :ratings
  resources :settlements do
		collection do
			post 'pay_all'
		end
	end
  get "/" => "loads#index"
end
