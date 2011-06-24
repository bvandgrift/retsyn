Retsyn::Application.routes.draw do

  resources :users, :reports

  root :to => "welcome#index"

end
