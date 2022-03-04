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
module Catalog
  class Vendor < ApplicationRecord
    belongs_to :owner, class_name: Catalog.owner_class # rubocop:disable Rails/ReflectionClassName

    has_many :products, class_name: 'Catalog::Product', inverse_of: :vendor, dependent: :destroy

    validates :name, length: { maximum: 50 }, presence: true, uniqueness: true
    validates :description, length: { maximum: 1000 }

    scope :active, -> { where(active: true) }
    scope :owned_by, -> (owner) { where(owner: owner) }

    def owned_by?(owner)
      owner.present? && owner == self.owner
    end
  end
end
