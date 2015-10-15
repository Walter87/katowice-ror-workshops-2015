Rails.application.routes.draw do
  devise_for :users
  
  root :to => 'visitors#index'

  resources :students do
  	get 'subjects' => 'students#subjects'
    #resource :subjects do
    #end
  end
  get 'report_subjects' => 'reports#subjects'
  get 'index' => 'visitors#index'
  resources :teachers do
  	get 'subjects' => 'teachers#subjects'
  	#resource :subjects do
  #end
  end
  
end
