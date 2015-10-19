Rails.application.routes.draw do

  devise_for :users
  
  root :to => 'visitors#index'

  resources :students do
  	get 'subjects' => 'students#subjects'
    get 'paid_tuition' => 'students#paid_tuition'
    get 'incomes' => 'incomes#index'
    resources :incomes , only: [:index, :edit]
  end

  get 'report_subjects' => 'reports#subjects'
  get 'index' => 'visitors#index'
  
  resources :teachers do
  	get 'subjects' => 'teachers#subjects'
  end
  
end
