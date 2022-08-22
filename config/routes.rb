Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  post "month", to: "calendars#month"
  resource :calendar, only: [:show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources 'attendances'


  # Defines the root path route ("/") logout_path
  # root "articles#index"
end
