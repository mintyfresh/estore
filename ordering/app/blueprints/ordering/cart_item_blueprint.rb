# frozen_string_literal: true

module Ordering
  class CartItemBlueprint < ApplicationBlueprint
    identifier :id

    fields :product_id, :name, :description, :price, :quantity, :total_price
  end
end
