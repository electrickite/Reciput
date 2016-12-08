Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :recipes do
    resources :ingredients, except: [:index, :show] do
      put :sort, on: :collection
    end
    resources :steps, except: [:index, :show] do
      put :sort, on: :collection
    end
  end

  resources :foods
  resources :users, only: [:edit, :update]

  root 'welcome#index'

end
