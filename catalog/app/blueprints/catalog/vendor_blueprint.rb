# frozen_string_literal: true

module Catalog
  class VendorBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description, :active

    view :detail do
      association :products, blueprint: ProductBlueprint do |vendor, _|
        vendor.products.order(:name, :id).page(1)
      end
    end
  end
end
