# frozen_string_literal: true

module Ordering
  class CartItemPolicy < ApplicationPolicy
    alias cart_item record

    def create?
      cart_item.owned_by?(customer)
    end

    def update?
      cart_item.owned_by?(customer)
    end

    def destroy?
      cart_item.owned_by?(customer)
    end

    def permitted_attributes
      %i[product_id quantity]
    end
  end
end
