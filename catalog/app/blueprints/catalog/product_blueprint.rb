# frozen_string_literal: true

module Catalog
  class ProductBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description, :price, :active

    view :detail do
      association :addons, blueprint: AddonBlueprint do |product, _|
        product.addons.order(:name).page(1)
      end
    end
  end
end
