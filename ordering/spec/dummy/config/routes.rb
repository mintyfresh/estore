# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ordering::Engine => '/ordering'
end
