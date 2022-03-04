# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  expires_at :datetime         not null
#  revoked_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Session, type: :model do
  subject(:session) { build(:session) }

  it 'has a valid factory' do
    expect(session).to be_valid
  end

  it 'is invalid without a user' do
    session.user = nil
    expect(session).to be_invalid
  end
end
