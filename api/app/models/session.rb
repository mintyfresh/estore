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
class Session < ApplicationRecord
  LIFETIME = 7.days

  belongs_to :user, inverse_of: :sessions

  before_create do
    self.expires_at = Time.current + LIFETIME
  end

  # @param token [String]
  # @return [Session, nil]
  def self.find_by_token(token)
    GlobalID::Locator.locate_signed(token, only: [self]) if token.present?
  end

  # @return [Boolean]
  def active?
    !expired? && !revoked?
  end

  # @return [Boolean]
  def expired?
    expires_at.past?
  end

  # @return [Boolean]
  def revoked?
    revoked_at.present?
  end

  # @return [Boolean]
  def revoke!
    revoked? || touch(:revoked_at)
  end

  # @return [String]
  def token
    @token ||= to_sgid(expires_at: expires_at).to_s
  end
end
