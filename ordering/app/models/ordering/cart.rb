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
module Ordering
  class Cart < ApplicationRecord
    belongs_to :customer, class_name: 'Ordering::Customer', inverse_of: :cart

    has_many :items, class_name: 'Ordering::CartItem', dependent: :destroy, inverse_of: :cart

    # @param customer [Customer]
    # @return [Boolean]
    def owned_by?(customer)
      customer.present? && customer == self.customer
    end

    # @return [Money]
    def subtotals
      items.group_by(&:currency).transform_values { |items| items.sum(0, &:total_price) }
    end

    # @return [Boolean]
    def clear
      !!items.destroy_all
    end
  end
end
