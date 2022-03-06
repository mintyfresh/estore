# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_purchase_orders
#
#  id             :bigint           not null, primary key
#  sales_order_id :bigint           not null
#  vendor_id      :bigint           not null
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ordering_purchase_orders_on_sales_order_id                (sales_order_id)
#  index_ordering_purchase_orders_on_sales_order_id_and_vendor_id  (sales_order_id,vendor_id) UNIQUE
#  index_ordering_purchase_orders_on_vendor_id                     (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (sales_order_id => ordering_sales_orders.id)
#  fk_rails_...  (vendor_id => catalog_vendors.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe PurchaseOrder, type: :model do
    subject(:purchase_order) { build(:purchase_order) }

    it 'has a valid factory' do
      expect(purchase_order).to be_valid
    end

    it 'is invalid without a sales order' do
      purchase_order.sales_order = nil
      expect(purchase_order).to be_invalid
    end

    it 'is invalid without a vendor' do
      purchase_order.vendor = nil
      expect(purchase_order).to be_invalid
    end

    it 'is invalid without a status' do
      purchase_order.status = nil
      expect(purchase_order).to be_invalid
    end

    it 'is invalid without order items' do
      purchase_order.order_items = []
      expect(purchase_order).to be_invalid
    end
  end
end
