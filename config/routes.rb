Rails.application.routes.draw do
  root :to => 'home#index'

  resources :games, :except => [:show, :index, :edit, :update, :new] do
    resources :words, :only => [:index]
  end

  resources :games, :except => [:show, :index, :edit, :udpate] do
    resources :guesses, :except => [:edit, :destroy, :update]
  end

end
