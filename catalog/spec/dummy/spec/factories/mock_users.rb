# frozen_string_literal: true

FactoryBot.define do
  factory :mock_user do
    name { Faker::Name.name }
  end
end
