# frozen_string_literal: true

module Catalog
  class VendorsController < ApplicationController
    def index
      @vendors = Vendor.order(:name)

      render json: VendorBlueprint.render_as_json(@vendors)
    end
  end
end
