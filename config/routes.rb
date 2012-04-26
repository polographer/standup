Standup::Application.routes.draw do
  get "welcome/index"

  get "welcome/about"

  devise_for :users

  resources :entries do
    collection do
      get 'export'
      get 'today'
    end
  end

  authenticated :user do
    root :to => 'entries#index'
  end

  match 'about' => 'welcome#about'

  root :to => 'welcome#index'

end
