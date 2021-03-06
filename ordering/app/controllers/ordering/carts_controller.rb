# frozen_string_literal: true

module Ordering
  class CartsController < ApplicationController
    before_action do
      authorize(current_cart)
    end

    def show
      render json: CartBlueprint.render_as_json(current_cart)
    end

    def clear
      if current_cart.clear
        render json: CartBlueprint.render_as_json(current_cart)
      else
        render json: current_cart.errors, status: :unprocessable_entity
      end
    end
  end
end
