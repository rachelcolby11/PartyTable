Rails.application.routes.draw do
  devise_for :users

  resources :parties do
    resources :tasks, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'welcome' => 'welcome#welcome'

  root to: 'welcome#index'

end
