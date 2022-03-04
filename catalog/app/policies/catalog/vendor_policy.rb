# frozen_string_literal: true

module Catalog
  class VendorPolicy < ApplicationPolicy
    alias vendor record

    def index?
      true
    end

    def show?
      vendor.active? || vendor.owned_by?(owner)
    end

    def create?
      vendor.owned_by?(owner)
    end

    def update?
      vendor.owned_by?(owner)
    end

    def destroy?
      vendor.owned_by?(owner)
    end

    def permitted_attributes
      %i[name description active]
    end

    class Scope < Scope
      def resolve
        scope.active
          .or(scope.owned_by(owner))
      end
    end
  end
end
