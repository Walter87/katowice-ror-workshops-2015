Rails.application.routes.draw do
  devise_for :users

  resources :students do
    get 'subjects'
  end
  get 'subjects' => 'reports#subjects'
  resources :teachers
end
