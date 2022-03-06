# frozen_string_literal: true

module Ordering
  class CartPolicy < ApplicationPolicy
    alias cart record

    def show?
      cart.owned_by?(customer)
    end

    def clear?
      cart.owned_by?(customer)
    end
  end
end
