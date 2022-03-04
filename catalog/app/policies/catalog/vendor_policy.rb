# frozen_string_literal: true

module Catalog
  class VendorPolicy < ApplicationPolicy
    alias vendor record

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
      owner.present? && owner == vendor.owner
    end

    def destroy?
      owner.present? && owner == vendor.owner
    end

    def permitted_attributes
      %i[name description]
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
