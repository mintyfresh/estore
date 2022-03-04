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
require 'rails_helper'

RSpec.describe MockUser, type: :model do
  subject(:mock_user) { build(:mock_user) }

  it 'has a valid factory' do
    expect(mock_user).to be_valid
  end
end
