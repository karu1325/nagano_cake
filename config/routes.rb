Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'
  scope module: :public do
    get 'customers' => 'customers#show', as: 'show'
    get 'customers/information/edit' => 'customers#edit', as: 'edit'
    patch 'customers' => 'customers#update', as: 'update'
    get 'customers/confilm' => 'customers#confilm', as: 'confilm'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
