Rails.application.routes.draw do

  root "home#index"

  get "painel"                  ,to: "dashboard#index",    as: :dashboard
  
  post "/create_tweet"          ,to: "tweet#create"

  namespace :auth do
    get   "/cadastrar"          ,to: "signup#new",         as: :signup
    post  "/create_signup"      ,to: "signup#create"

    get   "/entrar"             ,to: "login#new",           as: :login
    post  "/create_login"       ,to: "login#create"
    get   "/sair"               ,to: "login#delete",         as: :logout

  end

end
