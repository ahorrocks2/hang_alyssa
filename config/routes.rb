Rails.application.routes.draw do
  root :to => 'home#index'

  resources :games, :except => [:show, :index, :edit, :update, :new] do
    resources :rounds, :only => [:index, :update]
  end

  resources :games, :except => [:index, :edit, :udpate] do
    resources :guesses, :except => [:edit, :destroy, :update]
  end

end
