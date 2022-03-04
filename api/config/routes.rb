# frozen_string_literal: true

Rails.application.routes.draw do
  mount Catalog::Engine, at: '/catalog'
  mount Ordering::Engine, at: '/ordering'

  post   'auth/sign_in', to: 'auth#sign_in'
  delete 'auth/sign_out', to: 'auth#sign_out'
end
