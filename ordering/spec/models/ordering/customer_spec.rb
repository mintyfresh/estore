# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_customers
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  first_ordered_at :datetime
#  last_ordered_at  :datetime
#  orders_count     :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_ordering_customers_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => mock_users.id)
#
require 'rails_helper'

module Ordering
  RSpec.describe Customer, type: :model do
    subject(:customer) { build(:customer) }

    it 'has a valid factory' do
      expect(customer).to be_valid
    end
  end
end
