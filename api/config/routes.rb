# frozen_string_literal: true

Rails.application.routes.draw do
  mount Catalog::Engine, at: '/catalog'
end
