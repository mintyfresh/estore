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
  end
end
