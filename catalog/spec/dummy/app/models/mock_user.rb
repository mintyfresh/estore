# frozen_string_literal: true

# == Schema Information
#
# Table name: mock_users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MockUser < ApplicationRecord
end
