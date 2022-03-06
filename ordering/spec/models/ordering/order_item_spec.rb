# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_order_items
#
#  id                :bigint           not null, primary key
#  purchase_order_id :bigint           not null
#  product_id        :bigint           not null
#  name              :string           not null
#  description       :string
#  price_cents       :integer          not null
#  currency          :string           not null
#  quantity          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ordering_order_items_on_product_id                        (product_id)
#  index_ordering_order_items_on_purchase_order_id                 (purchase_order_id)
#  index_ordering_order_items_on_purchase_order_id_and_product_id  (purchase_order_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => catalog_products.id)
#  fk_rails_...  (purchase_order_id => ordering_purchase_orders.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe OrderItem, type: :model do
    subject(:order_item) { build(:order_item) }

    it 'has a valid factory' do
      expect(order_item).to be_valid
    end

    it 'is invalid without a purchase order' do
      order_item.purchase_order = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid without a product' do
      order_item.product = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid without a name' do
      order_item.name = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid without a price' do
      order_item.price_cents = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid without a currency' do
      order_item.currency = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid without a quantity' do
      order_item.quantity = nil
      expect(order_item).to be_invalid
    end

    it 'is invalid with a price less than 0' do
      order_item.price = -1
      expect(order_item).to be_invalid
    end

    it 'is invalid with a quantity less than 1' do
      order_item.quantity = 0
      expect(order_item).to be_invalid
    end
  end
end
