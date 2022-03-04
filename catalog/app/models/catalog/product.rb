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
#
# Indexes
#
#  index_catalog_products_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => catalog_vendors.id)
#
module Catalog
  class Product < ApplicationRecord
    belongs_to :vendor, class_name: 'Catalog::Vendor', inverse_of: :products

    has_many :addons, class_name: 'Catalog::Addon', inverse_of: :product, dependent: :destroy

    accepts_nested_attributes_for :addons, allow_destroy: true, reject_if: :all_blank

    validates :name, length: { maximum: 100 }, presence: true
    validates :description, length: { maximum: 1000 }
    validates :currency, inclusion: { in: Catalog.supported_currencies }
    validates :addons, length: { maximum: 25 }

    monetize :price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }
  end
end
