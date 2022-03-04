# frozen_string_literal: true

module Catalog
  class VendorsController < ApplicationController
    before_action only: %i[show update destroy] do
      @vendor = Vendor.find(params[:id])
      authorize(@vendor)
    end

    def index
      @vendors = policy_scope(Vendor).order(:name)

      render json: render_as_json(@vendors)
    end

    def show
      render json: render_as_json(@vendor, view: :detail)
    end

    def create
      @vendor = Vendor.new(permitted_attributes(Vendor))
      @vendor.owner = current_owner
      authorize(@vendor)

      if @vendor.save
        render json: render_as_json(@vendor, view: :detail), status: :created
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end

    def update
      if @vendor.update(permitted_attributes(@vendor))
        render json: render_as_json(@vendor, view: :detail)
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @vendor.destroy
        head :no_content
      else
        render json: @vendor.errors, status: :unprocessable_entity
      end
    end
  end
end
