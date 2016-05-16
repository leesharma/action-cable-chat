Rails.application.routes.draw do
  get '/:room', to: 'rooms#show', as: 'room'
  root to: 'rooms#index'
end
