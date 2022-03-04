# frozen_string_literal: true

module Catalog
  class ProductPolicy < ApplicationPolicy
    alias product record

    def index?
      true
    end

    def show?
      (product.active? && product.vendor.active?) || product.owned_by?(owner)
    end

    def create?
      product.owned_by?(owner)
    end

    def update?
      product.owned_by?(owner)
    end

    def destroy?
      product.owned_by?(owner)
    end

    def permitted_attributes
      [:name, :description, :price, :currency, :active,
       { addons_attributes: %i[id name description extra_price _destroy] }]
    end

    class Scope < Scope
      def resolve
        scope.active.joins(:vendor).merge(Vendor.active)
          .or(scope.owned_by(owner))
      end
    end
  end
end
