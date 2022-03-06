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
FactoryBot.define do
  factory :order_item, class: 'Ordering::OrderItem' do
    association :purchase_order, strategy: :build

    product { build(:product, vendor: purchase_order.vendor) }
    name { product.name }
    description { product.description }
    price { product.price }
    quantity { rand(1..10) }
  end
end
