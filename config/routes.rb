Rails.application.routes.draw do

  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/create" => "likes#create"
  
  get "account/:id/likes" => "account#likes"

  post "account/:id/destroy" => "account#destroy"
  get "account/:id/delete_confirm" =>"account#delete_confirm"

  post "account/:id/edit" =>"account#edit"
  get "account/:id/edit" => "account#edit_form"
  get "account/:id/show" => "account#show"

  post "account/logout" => "account#logout"
  post "account/login" => "account#login"
  get "account/login_form" => "account#login_form"

  post "account/:id" => "account#create"
  get "account/:id" => "account#new"

  post "posts/retweet_create" => "posts#retweet_create"
  get "posts/:id/retweet_form" => "posts#retweet_form"

  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
