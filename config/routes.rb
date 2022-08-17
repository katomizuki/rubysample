Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  post "month", to: "calendars#month"
  resource :calendar, only: [:show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resource 'attendance', only: [:create, :update]
  patch 'reststart', to: "attendances#start"
  patch 'restend', to: "attendances#end"


  # Defines the root path route ("/") logout_path
  # root "articles#index"
end
