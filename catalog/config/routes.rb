# frozen_string_literal: true

Catalog::Engine.routes.draw do
  resources :vendors do
    resources :products
  end
end
