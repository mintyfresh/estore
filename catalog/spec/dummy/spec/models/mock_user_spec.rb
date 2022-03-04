# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MockUser, type: :model do
  subject(:mock_user) { build(:mock_user) }

  it 'has a valid factory' do
    expect(mock_user).to be_valid
  end
end
