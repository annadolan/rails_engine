Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :items do
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :invoice_items do
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :merchants do
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/most_revenue', to: 'most_revenue#index'
      end
      namespace :transactions do
        get '/:id/invoice', to: 'invoice#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :customers do
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#index'
      end
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
