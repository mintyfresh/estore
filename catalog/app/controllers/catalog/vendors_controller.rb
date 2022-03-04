# frozen_string_literal: true

module Catalog
  class VendorsController < ApplicationController
    def index
      @vendors = Vendor.order(:name)

      render json: VendorBlueprint.render_as_json(@vendors)
    end

    def show
      @vendor = Vendor.find(params[:id])

      render json: VendorBlueprint.render_as_json(@vendor, view: :detail)
    end
  end
end
