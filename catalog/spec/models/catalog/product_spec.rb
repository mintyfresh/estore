# frozen_string_literal: true

# == Schema Information
#
# Table name: catalog_products
#
#  id          :bigint           not null, primary key
#  vendor_id   :bigint           not null
#  name        :string           not null
#  description :string
#  price_cents :integer          not null
#  currency    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean          default(FALSE), not null
#
# Indexes
#
#  index_catalog_products_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => catalog_vendors.id)
#
require 'rails_helper'

module Catalog
  RSpec.describe Product, type: :model do
    subject(:product) { build(:product) }

    it 'has a valid factory' do
      expect(product).to be_valid
    end

    it 'is invalid without a vendor' do
      product.vendor = nil
      expect(product).to be_invalid
    end

    it 'is invalid without a name' do
      product.name = nil
      expect(product).to be_invalid
    end

    it 'is invalid with a name longer than 100 characters' do
      product.name = 'a' * 101
      expect(product).to be_invalid
    end

    it 'is valid without a description' do
      product.description = nil
      expect(product).to be_valid
    end

    it 'is invalid with a description longer than 1000 characters' do
      product.description = 'a' * 1001
      expect(product).to be_invalid
    end

    it 'is invalid without a price' do
      product.price_cents = nil
      expect(product).to be_invalid
    end

    it 'is invalid with a price less than 0' do
      product.price = -1
      expect(product).to be_invalid
    end

    it 'is invalid without a currency' do
      product.currency = nil
      expect(product).to be_invalid
    end
  end
end
