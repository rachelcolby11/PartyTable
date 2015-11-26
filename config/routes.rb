Rails.application.routes.draw do
  devise_for :users

  resources :parties do
    get "timeline", on: :member #/parties/123/timeline
    resources :tasks, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'welcome' => 'welcome#welcome'

  root to: 'welcome#index'

end
