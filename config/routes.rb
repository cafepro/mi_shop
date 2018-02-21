Rails.application.routes.draw do

  root to: "pages#index", via: [:get, :post]

  # resources :products

  mount Tolk::Engine => '/admin/tolk', as: 'tolk'
  post "/admin/tolk/:id/translate", to: 'tolk/locales#translate'

  # namespace :tolk do
  #   resources :locales do
  #     member do
  #       get  :translate
  #       post :translate
  #     end
  #   end
  # end

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
  post "/contacts/contact", to: "contacts#contact"

  get  "/:page_id", to: "pages#index"
  post "/:page_id", to: "pages#index"

end


Spree::Core::Engine.add_routes do
  namespace :admin do

    resources :layouts do
      member do
        get :clone
      end
    end

    resources :pages do
      collection do
        post :update_positions
      end
      member do
        get :clone
      end
    end

    resources :page_images do
      member do
        get :show_code
      end
    end
  end

  resources :orders do
    collection do
      get :upload_photos
      post :upload_photos
    end
  end

end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :configurations
  end
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :asociates
  end
end
