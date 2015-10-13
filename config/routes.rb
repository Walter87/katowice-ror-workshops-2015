Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  root :to => 'devise/sessions#new'
  end

  resources :students do
    get 'subjects'
  end
  get 'report_subjects' => 'reports#subjects'
  get 'index' => 'visitors#index'
  resources :teachers
  
end
