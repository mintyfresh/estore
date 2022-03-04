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
FactoryBot.define do
  factory :cart_item, class: 'Ordering::CartItem' do
    association :cart, strategy: :build
    association :product, strategy: :build

    name { product.name }
    description { product.description }
    price { product.price }
    quantity { rand(1..10) }
  end
end
