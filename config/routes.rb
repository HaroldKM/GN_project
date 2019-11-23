Rails.application.routes.draw do
  get "/dashboard" => "accounts#index"

  get 'profil/:username' => 'accounts#profil' , as: :profil
  get "post/like/:post_id" => "likes#save_like" , as: :like_post
  post "follow/account" => "accounts#follow_account", as: :follow_account

  devise_for :accounts

  resources :posts, only: [:new,:create,:show]
  resources :comments, only: [:create]

  root "public#homepage"
end
