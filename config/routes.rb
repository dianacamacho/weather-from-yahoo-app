Rails.application.routes.draw do
  get 'forecasts/index'

  get '/' => 'forecasts#index'
end
