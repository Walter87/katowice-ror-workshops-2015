Rails.application.routes.draw do
  devise_for :users

  resources :students do
    
  end
  get 'subjects' => 'reports#subjects'
end
