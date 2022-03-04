# frozen_string_literal: true

module Catalog
  class ProductPolicy < ApplicationPolicy
    alias product record

    def index?
      true
    end

    def show?
      true
    end

    def create?
      owner.present?
    end

    def update?
      owner.present? && owner == product.vendor.owner
    end

    def destroy?
      owner.present? && owner == product.vendor.owner
    end

    def permitted_attributes
      [:name, :description, :price, :currency, { addons_attributes: %i[id name description extra_price _destroy] }]
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
