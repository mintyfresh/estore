# frozen_string_literal: true

# == Schema Information
#
# Table name: catalog_vendors
#
#  id          :bigint           not null, primary key
#  owner_id    :bigint           not null
#  name        :citext           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_catalog_vendors_on_name      (name) UNIQUE
#  index_catalog_vendors_on_owner_id  (owner_id)
#
require 'rails_helper'

module Catalog
  RSpec.describe Vendor, type: :model do
    subject(:vendor) { build(:vendor) }

    it 'has a valid factory' do
      expect(vendor).to be_valid
    end

    it 'is invalid without an owner' do
      vendor.owner = nil
      expect(vendor).to be_invalid
    end

    it 'is invalid without a name' do
      vendor.name = nil
      expect(vendor).to be_invalid
    end

    it 'is invalid with a duplicate name' do
      create(:vendor, name: vendor.name)
      expect(vendor).to be_invalid
    end

    it 'is invalid with a name longer than 50 characters' do
      vendor.name = 'a' * 51
      expect(vendor).to be_invalid
    end

    it 'is valid without a description' do
      vendor.description = nil
      expect(vendor).to be_valid
    end

    it 'is invalid with a description longer than 1000 characters' do
      vendor.description = 'a' * 1001
      expect(vendor).to be_invalid
    end
  end
end
