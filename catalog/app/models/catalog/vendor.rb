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
#
# Indexes
#
#  index_catalog_vendors_on_name      (name) UNIQUE
#  index_catalog_vendors_on_owner_id  (owner_id)
#
module Catalog
  class Vendor < ApplicationRecord
    belongs_to :owner, class_name: Catalog.owner_class # rubocop:disable Rails/ReflectionClassName

    validates :name, presence: true, uniqueness: true
    validates :description, length: { maximum: 1000 }
  end
end
