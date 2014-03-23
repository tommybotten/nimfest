Migrationtest::Application.routes.draw do
  resources :loads
  resources :slots
  resources :aircrafts
  resources :prices
  resources :jumpers
  resources :clubs
  resources :ratings
  match "quarterlyreports/:quarter" => "settlements#showqreport", via: :get
  match "quarterlyreports/" => "settlements#quarterlyreports", via: :get
  resources :settlements do
    get 'reports/:year', to: 'settlements#reports'
		collection do
			post 'pay_all'
		end
	end
  get "/" => "loads#index"
end
