Rails.application.routes.draw do
  get 'tasks/about'

  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'tasks', to: 'tasks#index'
  get 'tasks/new', to: 'tasks#new', as: :new
  get 'tasks/:id', to: 'tasks#onetask', as: :task
  post 'tasks', to: 'tasks#create', as: :create
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit
  patch 'tasks/:id', to: 'tasks#update', as: :update
  delete 'tasks/:id', to: 'tasks#destroy'
end

# Rails.application.routes.draw do
#   resources :brands, only: [:index, :show] do
#     resources :products, only: [:index, :show]
#   end

#   resource :basket, only: [:show, :update, :destroy]

#   resolve('Basket') { route_for(:basket) }
# end
