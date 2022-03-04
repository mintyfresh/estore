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
module Catalog
  class Addon < ApplicationRecord
    belongs_to :product, class_name: 'Catalog::Product', inverse_of: :addons

    validates :name, length: { maximum: 50 }, presence: true, uniqueness: { scope: :product }
    validates :description, length: { maximum: 1000 }
    validates :currency, inclusion: { in: Catalog.supported_currencies }

    monetize :extra_price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }
  end
end
