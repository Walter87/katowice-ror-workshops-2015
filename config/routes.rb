Rails.application.routes.draw do
  devise_for :users
  
  root :to => 'visitors#index'

  resources :students do
    resource :subjects do
    end
  end
  get 'report_subjects' => 'reports#subjects'
  get 'index' => 'visitors#index'
  resources :teachers do
  	resource :subjects do
  end
  end
  
end
