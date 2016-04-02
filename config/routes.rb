Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :recipes do
    resources :ingredients, except: [:index, :show]
  end

  resources :foods

  root 'welcome#index'

end
