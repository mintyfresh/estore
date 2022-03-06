# frozen_string_literal: true

module Ordering
  class ItemsController < ApplicationController
    before_action do
      authorize(current_cart)
    end

    before_action only: %i[update destroy] do
      @item = current_cart.items.find(params[:id])
      authorize(@item)
    end

    def create
      product_id, quantity = permitted_attributes(CartItem).values_at(:product_id, :quantity)

      @item = current_cart.items.create_with(quantity: 0).find_or_initialize_by(product_id: product_id)
      @item.increment(:quantity, quantity.to_i)
      authorize(@item)

      if @item.save
        render json: CartBlueprint.render_as_json(current_cart)
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    def update
      if @item.update(permitted_attributes(CartItem))
        render json: CartBlueprint.render_as_json(current_cart)
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @item.destroy
        render json: CartBlueprint.render_as_json(current_cart)
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  end
end
