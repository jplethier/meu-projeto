MeuProjeto::Application.routes.draw do

    devise_for :users

    get "relationships/create"

    get "relationships/destroy"

    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :sessions, :only => [:create, :destroy]
    resources :relationships, :only => [:create, :destroy]
    resources :ofertas do
        resources :comments
    end

    match '/novocadastro',         :to => 'users#novocadastro'
    match '/novaoferta',           :to => 'ofertas#novaoferta'
    match '/signout',              :to => 'sessions#destroy'
    match '/ofertas_do_dia',       :to => 'ofertas#ofertas_do_dia'
    match '/ofertas_do_dia/:tipo', :to => 'ofertas#ofertas_do_dia'
    match '/home/:tipo',           :to => 'pages#home'
    match '/todas_ofertas',        :to => 'ofertas#todas_ofertas'
    match '/todas_ofertas/:tipo',  :to => 'ofertas#todas_ofertas'
  
    # The priority is based upon order of creation:
    # first created -> highest priority.

    # Sample of regular route:
    #   match 'products/:id' => 'catalog#view'
    # Keep in mind you can assign values other than :controller and :action

    # Sample of named route:
    #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
    # This route can be invoked with purchase_url(:id => product.id)

    # Sample resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Sample resource route with options:
    #   resources :products do
    #     member do
    #       get 'short'
    #       post 'toggle'
    #     end
    #
    #     collection do
    #       get 'sold'
    #     end
    #   end

    # Sample resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Sample resource route with more complex sub-resources
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', :on => :collection
    #     end
    #   end

    # Sample resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    root :to => "pages#home"

    # See how all your routes lay out with "rake routes"

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id(.:format)))'
end
