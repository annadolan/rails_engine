Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/', to: 'invoices#index'
        get '/:id', to: 'invoices#show'
        get '/:id/transactions', to: 'transactions#index'
      end
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
