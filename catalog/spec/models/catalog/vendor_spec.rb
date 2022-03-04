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
  end
end
