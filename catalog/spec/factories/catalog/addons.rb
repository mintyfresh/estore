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
FactoryBot.define do
  factory :addon, class: 'Catalog::Addon' do
    association :product, strategy: :build

    sequence(:name) { |n| "#{Faker::Commerce.product_name} #{n}" }
    description { Faker::Hipster.sentence }
    currency { Catalog.supported_currencies.sample }
    extra_price { Faker::Commerce.price }
  end
end
