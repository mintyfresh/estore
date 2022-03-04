# frozen_string_literal: true

require 'catalog'
require 'pundit'

require 'ordering/version'
require 'ordering/engine'

module Ordering
  mattr_accessor :user_class, default: 'User'
  mattr_accessor :controller_base_class, default: 'ApplicationController'
end
