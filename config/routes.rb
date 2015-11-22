Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/welcome'

  root to: 'welcome#index'

end
