# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_order_items
#
#  id                :bigint           not null, primary key
#  purchase_order_id :bigint           not null
#  product_id        :bigint           not null
#  name              :string           not null
#  description       :string
#  price_cents       :integer          not null
#  currency          :string           not null
#  quantity          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ordering_order_items_on_product_id                        (product_id)
#  index_ordering_order_items_on_purchase_order_id                 (purchase_order_id)
#  index_ordering_order_items_on_purchase_order_id_and_product_id  (purchase_order_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => catalog_products.id)
#  fk_rails_...  (purchase_order_id => ordering_purchase_orders.id)
#
module Ordering
  class OrderItem < ApplicationRecord
    belongs_to :purchase_order, class_name: 'Ordering::PurchaseOrder', inverse_of: :order_items
    belongs_to :product, class_name: 'Catalog::Product', inverse_of: :order_items

    monetize :price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }

    validates :name, :currency, presence: true
    validates :quantity, numericality: { greater_than: 0 }

    # @return [Money]
    def total_price
      price * quantity
    end
  end
end
