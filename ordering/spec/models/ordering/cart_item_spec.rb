# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_cart_items
#
#  id          :bigint           not null, primary key
#  cart_id     :bigint           not null
#  product_id  :bigint           not null
#  name        :string           not null
#  description :string
#  price_cents :integer          not null
#  currency    :string           not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_cart_items_on_cart_id                 (cart_id)
#  index_ordering_cart_items_on_cart_id_and_product_id  (cart_id,product_id) UNIQUE
#  index_ordering_cart_items_on_product_id              (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => ordering_carts.id)
#  fk_rails_...  (product_id => catalog_products.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe CartItem, type: :model do
    subject(:cart_item) { build(:cart_item) }

    it 'has a valid factory' do
      expect(cart_item).to be_valid
    end

    it 'is invalid without a cart' do
      cart_item.cart = nil
      expect(cart_item).to be_invalid
    end

    it 'is invalid without a product' do
      cart_item.product = nil
      expect(cart_item).to be_invalid
    end

    it 'is invalid without a quantity' do
      cart_item.quantity = nil
      expect(cart_item).to be_invalid
    end

    it 'is invalid when quantity is less than 1' do
      cart_item.quantity = 0
      expect(cart_item).to be_invalid
    end

    describe '#total_price' do
      subject(:total_price) { cart_item.total_price }

      it 'returns the total price of the cart item' do
        expect(total_price).to eq(cart_item.price * cart_item.quantity)
      end
    end
  end
end
