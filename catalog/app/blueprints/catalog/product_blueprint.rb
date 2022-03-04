# frozen_string_literal: true

module Catalog
  class ProductBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description, :price
  end
end
