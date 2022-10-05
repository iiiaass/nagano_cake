Rails.application.routes.draw do

#顧客用
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
#管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 scope module: :public do
    root to: 'homes#top'
    get '/about'=>'homes#about'
    resources :items, only:[:index, :show]
    resources :customers,only:[:show,:edit,:update]
    get '/customers/unsubscribe'=>'customers#unsubscribe'
    patch '/customers/withdraw'=>'customers#withdraw'
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all'=>'cart_items#destroy_all'
    resources :orders, only:[:new, :create, :index, :show]
    post '/orders/confirmation'=>'orders#confirmation'
    get '/orders/completion'=>'orders#completion'
    resources :addresses,only:[:index,:edit,:update,:create,:destroy]
  end



  namespace :admin do
    root to: 'homes#top'
    resources :items,only:[:index,:new,:show,:create,:edit,:up]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update] do
    resources :order_products,only:[:update]
  end
  end
end
