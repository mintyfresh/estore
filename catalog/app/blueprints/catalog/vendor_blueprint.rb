# frozen_string_literal: true

module Catalog
  class VendorBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description, :active

    view :detail do
      association :products, blueprint: ProductBlueprint do |vendor, options|
        Pundit.policy_scope(options[:owner], vendor.products).order(:name, :id).page(1)
      end
    end
  end
end
