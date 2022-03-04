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
FactoryBot.define do
  factory :product, class: 'Catalog::Product' do
    association :vendor, strategy: :build

    name { Faker::Commerce.product_name }
    description { Faker::Hipster.sentence }
    currency { Catalog.supported_currencies.sample }
    price { Faker::Commerce.price }
  end
end
