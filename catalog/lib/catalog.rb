# frozen_string_literal: true

require 'catalog/version'
require 'catalog/engine'

module Catalog
  mattr_accessor :owner_class
  mattr_accessor :controller_class do
    'ApplicationController'
  end

  mattr_accessor :supported_currencies do
    %w[CAD USD EUR]
  end
end
