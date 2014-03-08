CityDashboard::Application.routes.draw do

  root to: 'main#index'

  get '/station_usage', to: 'main#station_usage'
  get '/yw_incidents', to: 'main#yw_incidents'
  get '/yw_investments', to: 'main#yw_investments'
  get '/geocode/:postcode', to: 'main#geocode'

end
