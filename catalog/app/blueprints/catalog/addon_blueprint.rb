# frozen_string_literal: true

module Catalog
  class AddonBlueprint < ApplicationBlueprint
    identifier :id

    fields :name, :description, :extra_price
  end
end
