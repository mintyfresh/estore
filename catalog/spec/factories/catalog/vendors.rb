# frozen_string_literal: true

# == Schema Information
#
# Table name: catalog_vendors
#
#  id          :bigint           not null, primary key
#  owner_id    :bigint           not null
#  name        :citext           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean          default(FALSE), not null
#
# Indexes
#
#  index_catalog_vendors_on_name      (name) UNIQUE
#  index_catalog_vendors_on_owner_id  (owner_id)
#
FactoryBot.define do
  factory :vendor, class: 'Catalog::Vendor' do
    owner { build(Catalog.owner_class.underscore) }
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
    description { Faker::Hipster.sentence }
    active { true }

    trait :inactive do
      active { false }
    end

    trait :with_products do
      transient do
        products_count { 3 }
      end

      after(:build) do |vendor, e|
        vendor.products = build_list(:product, e.products_count, vendor: vendor)
      end
    end
  end
end
