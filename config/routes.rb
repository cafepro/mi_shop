Rails.application.routes.draw do

  root to: "pages#index", via: [:get, :post]
  get "/:page_id", to: "pages#index", via: [:get, :post]

  mount Tolk::Engine => '/tolk', :as => 'tolk'

  # post "/dump_all" => "texts#dump_all", :as => :dump_all_locales
  # get "/stats" => "locales#stats"

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :personas do
      collection do
        post :update_positions
      end
    end
  end
end


Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :layouts
  end
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages do
      collection do
        post :update_positions
      end
    end
  end
end
