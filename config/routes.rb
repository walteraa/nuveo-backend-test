Rails.application.routes.draw do
  get 'workflow/consume' => 'workflows#consume',defaults: { format: 'csv' }
  resources :workflow, defaults: { format: 'json' }, controller: 'workflows', only: %i[index show create update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
