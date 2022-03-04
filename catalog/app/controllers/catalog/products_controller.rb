# frozen_string_literal: true

module Catalog
  class ProductsController < ApplicationController
    before_action do
      @vendor = Vendor.find(params[:vendor_id])
      authorize(@vendor, :show?)
    end

    before_action only: %i[show update destroy] do
      @product = @vendor.products.find(params[:id])
      authorize(@product)
    end

    def index
      @products = policy_scope(@vendor.products).order(:name).page(params[:page])

      render json: ProductBlueprint.render_as_json(@products)
    end

    def show
      render json: ProductBlueprint.render_as_json(@product, view: :detail)
    end

    def create
      @product = @vendor.products.new(permitted_attributes(Product))
      authorize(@product)

      if @product.save
        render json: ProductBlueprint.render_as_json(@product, view: :detail), status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(permitted_attributes(@product))
        render json: ProductBlueprint.render_as_json(@product, view: :detail)
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @product.destroy
        head :no_content
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  end
end
