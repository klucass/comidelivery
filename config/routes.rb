Rails.application.routes.draw do

  resources :item_pedidos
  resources :usuarios, only: [:new, :create]
  resources :restaurantes
  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]
  get '/login' => 'user_sessions#new'
  get '/entrar' => 'user_sessions#new'
  get '/pedidos/checkout' => 'pedidos#checkout' # quando o cliente clica em finalizar, na tela do restaurante
  get '/pedidos/acompanhamento' => 'pedidos#acompanhamento'
  resources :pedidos, only: [:create, :new, :destroy, :show, :update]
  get '/account' => 'account#index'

  get '/painel' => 'painel#index'
  get '/painel/pedidos' => 'painel#pedidos'
  get 'painel/pedidos/:id' => 'painel#show_pedido'
  post '/painel/pedidos/' => 'painel#encerrar_pedido'
  post '/painel/cancelar_pedido/' => 'painel#cancelar_pedido'
  get '/painel/produtos' => 'painel#produtos'
  get '/painel/produtos/new' => 'itens#new'
  get '/painel/restaurante' => 'painel#restaurante'
  get 'painel/pizzas' => 'painel#pizzas'
  get 'painel/pizzas/new' => 'painel#new_sabor'
  get 'painel/edit_sabor/:id' => 'painel#edit_sabor'
  post 'painel/pizzas/new' => 'painel#create_sabor'
  patch 'painel/edit_sabor/update/:id' => 'painel#update_sabor'
  post 'painel/pizzas/:id' => 'painel#destroy_sabor'

  resources :enderecos, only: [:create, :new, :destroy]
  resources :itens
  get '/contato' => 'home#suporte'
  get '/cadastro_restaurante' => 'home#cadastro_restaurante'
  get 'precadastro' => 'home#cadastro_restaurante'
  post '/cadastro_restaurante' => 'home#precadastro'
  get 'cadastro_restaurante/sucesso' => 'home#precadastro_sucesso'

  get 'dashboard' => 'dashboard#index'
  get 'dashboard/pedidos' => 'dashboard#pedidos'
  get 'dashboard/pedidos/:id' => 'dashboard#show_pedido'
  get 'dashboard/precadastro' => 'dashboard#precadastro'
  get 'dashboard/edit/:id' => 'dashboard#edit'
  post 'dashboard/update/:id'=> 'dashboard#update'
  patch 'dashboard/update/:id'=> 'dashboard#update'

  get '/busca_restaurantes' => 'restaurantes#busca'

  root 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
