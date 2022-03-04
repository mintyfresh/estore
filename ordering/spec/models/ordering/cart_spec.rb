# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_carts
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_carts_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => ordering_customers.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe Cart, type: :model do
    subject(:cart) { build(:cart) }

    it 'has a valid factory' do
      expect(cart).to be_valid
    end

    it 'is invalid without a customer' do
      cart.customer = nil
      expect(cart).to be_invalid
    end

    context 'with items' do
      subject(:cart) { build(:cart, :with_items) }

      it 'has a valid factory' do
        expect(cart).to be_valid
      end
    end
  end
end
