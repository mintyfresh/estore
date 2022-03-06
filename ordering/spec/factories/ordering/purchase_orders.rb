# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_purchase_orders
#
#  id             :bigint           not null, primary key
#  sales_order_id :bigint           not null
#  vendor_id      :bigint           not null
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ordering_purchase_orders_on_sales_order_id                (sales_order_id)
#  index_ordering_purchase_orders_on_sales_order_id_and_vendor_id  (sales_order_id,vendor_id) UNIQUE
#  index_ordering_purchase_orders_on_vendor_id                     (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (sales_order_id => ordering_sales_orders.id)
#  fk_rails_...  (vendor_id => catalog_vendors.id)
#
FactoryBot.define do
  factory :purchase_order, class: 'Ordering::PurchaseOrder' do
    association :sales_order, strategy: :build
    association :vendor, strategy: :build

    status { 'submitted' }

    transient do
      order_items_count { 3 }
    end

    after(:build) do |purchase_order, e|
      purchase_order.order_items = build_list(:order_item, e.order_items_count, purchase_order: purchase_order)
    end
  end
end
