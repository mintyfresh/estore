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
FactoryBot.define do
  factory :session do
    association :user, strategy: :build

    trait :expired do
      expires_at { 5.minutes.ago }
    end

    trait :revoked do
      revoked_at { Time.current }
    end
  end
end
