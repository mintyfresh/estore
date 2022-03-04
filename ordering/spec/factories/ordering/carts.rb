# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_carts
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_ordering_carts_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => ordering_customers.id)
#
FactoryBot.define do
  factory :cart, class: 'Ordering::Cart' do
    association :customer, strategy: :build

    trait :with_items do
      transient do
        items_count { 3 }
      end

      after(:build) do |cart, e|
        cart.items = build_list(:cart_item, e.items_count, cart: cart)
      end
    end
  end
end
