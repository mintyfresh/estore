# frozen_string_literal: true

module Catalog
  class VendorsController < ApplicationController
    before_action only: %i[show update destroy] do
      @vendor = Vendor.find(params[:id])
    end

    def index
      @vendors = policy_scope(Vendor).order(:name)

      render json: VendorBlueprint.render_as_json(@vendors)
    end

    def show
      authorize(@vendor)

      render json: VendorBlueprint.render_as_json(@vendor, view: :detail)
    end

    def create
      @vendor = authorize(Vendor).new(permitted_attributes(Vendor))
      @vendor.owner = current_owner

      if @vendor.save
        render json: VendorBlueprint.render_as_json(@vendor, view: :detail), status: :created
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end

    def update
      authorize(@vendor)

      if @vendor.update(permitted_attributes(@vendor))
        render json: VendorBlueprint.render_as_json(@vendor, view: :detail)
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end

    def destroy
      authorize(@vendor)

      if @vendor.destroy
        head :no_content
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end
  end
end
