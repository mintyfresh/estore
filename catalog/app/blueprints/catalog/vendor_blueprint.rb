# frozen_string_literal: true

module Catalog
  class VendorBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description
  end
end
