# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_sales_orders
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_sales_orders_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => ordering_customers.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe SalesOrder, type: :model do
    subject(:sales_order) { build(:sales_order) }

    it 'has a valid factory' do
      expect(sales_order).to be_valid
    end

    it 'is invalid without a customer' do
      sales_order.customer = nil
      expect(sales_order).to be_invalid
    end

    it 'is invalid without a status' do
      sales_order.status = nil
      expect(sales_order).to be_invalid
    end

    it 'is invalid without purchase orders' do
      sales_order.purchase_orders = []
      expect(sales_order).to be_invalid
    end
  end
end
