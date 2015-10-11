Rails.application.routes.draw do
  devise_for :users

  resources :students do
    get 'subjects'
  end
  get 'subjects' => 'reports#subjects'
  get 'index' => 'visitors#index'
  resources :teachers
end
