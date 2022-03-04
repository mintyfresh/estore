# frozen_string_literal: true

module Ordering
  class CartBlueprint < ApplicationBlueprint
    identifier :id

    fields :subtotals

    association :items, blueprint: Ordering::CartItemBlueprint do |cart, _|
      cart.items.preload(product: :vendor).order(:id)
    end
  end
end
