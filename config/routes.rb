Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users
      resources :interviews, controller:"interviews" , except: [:new, :edit]#para que no exista new y edit
    end
  end
end
