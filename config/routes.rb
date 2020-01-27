Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json} do
    resources :users, only: [:create, :show] do
      resources :characters, only: [:index]
    end
    resource :characters, only: [:create] do
      post ':id/select' => "characters#select"
      get ':id/guild' => "wowguilds#show"
      delete ':id/guild/leave' => "wowguilds#leave"
      post ':id/guild/:guild_id/join' => "wowguilds#join"
    end

    get 'realms/:name/guilds' => "wowguilds#index"

    resources :wowguilds, only: [:create, :show] do
      resources :rooms, only: [:index, :create]
      resources :characters, only: [:index]
    end 

    resources :rooms, only: [] do
      resources :messages, only: [:create, :index]
    end
    resource :session, only: [:create, :destroy]
  end
end
