# frozen_string_literal: true

# == Schema Information
#
# Table name: catalog_addons
#
#  id                :bigint           not null, primary key
#  product_id        :bigint           not null
#  name              :citext           not null
#  description       :string
#  extra_price_cents :integer
#  currency          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_catalog_addons_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => catalog_products.id)
#
require 'rails_helper'

module Catalog
  RSpec.describe Addon, type: :model do
    subject(:addon) { build(:addon) }

    it 'has a valid factory' do
      expect(addon).to be_valid
    end

    it 'is invalid without a product' do
      addon.product = nil
      expect(addon).to be_invalid
    end

    it 'is invalid without a name' do
      addon.name = nil
      expect(addon).to be_invalid
    end

    it 'is invalid with a name longer than 100 characters' do
      addon.name = 'a' * 101
      expect(addon).to be_invalid
    end

    it 'is valid without a description' do
      addon.description = nil
      expect(addon).to be_valid
    end

    it 'is invalid with a description longer than 1000 characters' do
      addon.description = 'a' * 1001
      expect(addon).to be_invalid
    end

    it 'is invalid without an extra price' do
      addon.extra_price_cents = nil
      expect(addon).to be_invalid
    end

    it 'is invalid with an extra price that is not an integer' do
      addon.extra_price_cents = 'a'
      expect(addon).to be_invalid
    end

    it 'is invalid with an extra price less than 0' do
      addon.extra_price_cents = -1
      expect(addon).to be_invalid
    end

    it 'is invalid without a currency' do
      addon.currency = nil
      expect(addon).to be_invalid
    end

    it 'is invalid with a currency that is not in the list of supported currencies' do
      addon.currency = 'a'
      expect(addon).to be_invalid
    end
  end
end
