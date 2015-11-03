Rails.application.routes.draw do
  root :to => 'home#index'

  resources :games, :except => [:index, :edit, :udpate] do
    resources :guesses, :except => [:edit, :destroy, :update, :new]
  end

end
