Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'weathers#index'

  resource :weather, only: [] do
    collection do
      get :random
      get :location_wise
    end
  end
end
