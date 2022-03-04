# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_cart_items
#
#  id          :bigint           not null, primary key
#  cart_id     :bigint           not null
#  product_id  :bigint           not null
#  name        :string           not null
#  description :string
#  price_cents :integer          not null
#  currency    :string           not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_cart_items_on_cart_id                 (cart_id)
#  index_ordering_cart_items_on_cart_id_and_product_id  (cart_id,product_id) UNIQUE
#  index_ordering_cart_items_on_product_id              (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => ordering_carts.id)
#  fk_rails_...  (product_id => catalog_products.id)
#
module Ordering
  class CartItem < ApplicationRecord
    belongs_to :cart, class_name: 'Ordering::Cart', inverse_of: :items
    belongs_to :product, class_name: 'Catalog::Product', inverse_of: false

    validates :quantity, numericality: { greater_than: 0 }

    validate on: :create, if: :product do
      errors.add(:product, :unavailable) unless product.available?
    end

    monetize :price_cents, with_model_currency: :currency, allow_nil: true

    before_create do
      self.name        = product.name
      self.description = product.description
      self.price       = product.price
    end

    # @!method owned_by?(customer)
    #   @param customer [Customer]
    #   @return [Boolean]
    delegate :owned_by?, to: :cart, allow_nil: true

    # @return [Money]
    def total_price
      price * quantity
    end
  end
end
