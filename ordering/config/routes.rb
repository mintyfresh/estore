# frozen_string_literal: true

Ordering::Engine.routes.draw do
  resource :cart, only: :show do
    delete :clear

    resources :items, only: %i[create update destroy]
  end
end
