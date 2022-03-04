# frozen_string_literal: true

module Catalog
  class ProductsController < ApplicationController
    before_action do
      @vendor = Vendor.find(params[:vendor_id])
    end

    def index
      @products = @vendor.products.order(:name).page(params[:page])

      render json: ProductBlueprint.render_as_json(@products)
    end

    def show
      @product = @vendor.products.find(params[:id])

      render json: ProductBlueprint.render_as_json(@product, view: :detail)
    end
  end
end
