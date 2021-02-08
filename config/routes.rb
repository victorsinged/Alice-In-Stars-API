Rails.application.routes.draw do
  get '/asteroids' => 'asteroids#search'
end
