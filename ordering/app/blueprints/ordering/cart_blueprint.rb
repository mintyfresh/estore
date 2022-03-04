# frozen_string_literal: true

module Ordering
  class CartBlueprint < ApplicationBlueprint
    identifier :id

    fields :subtotals

    association :items, blueprint: Ordering::CartItemBlueprint
  end
end
