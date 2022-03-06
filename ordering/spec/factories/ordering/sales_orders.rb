# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_sales_orders
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_sales_orders_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => ordering_customers.id)
#
FactoryBot.define do
  factory :sales_order, class: 'Ordering::SalesOrder' do
    association :customer, strategy: :build
    status { 'submitted' }

    transient do
      purchase_orders_count { 3 }
    end

    after(:build) do |sales_order, e|
      sales_order.purchase_orders = build_list(:purchase_order, e.purchase_orders_count, sales_order: sales_order)
    end
  end
end
