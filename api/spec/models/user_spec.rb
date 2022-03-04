# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :citext           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :binary           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to be_invalid
  end

  it 'is invalid when the email is not unique' do
    create(:user, email: user.email)
    expect(user).to be_invalid
  end

  it 'is invalid without a first name' do
    user.first_name = nil
    expect(user).to be_invalid
  end

  it 'is invalid when first name is too long' do
    user.first_name = 'a' * 51
    expect(user).to be_invalid
  end

  it 'is invalid without a last name' do
    user.last_name = nil
    expect(user).to be_invalid
  end

  it 'is invalid when last name is too long' do
    user.last_name = 'a' * 51
    expect(user).to be_invalid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to be_invalid
  end

  it 'is invalid with a password confirmation that does not match the password' do
    user.password_confirmation = 'not the same password'
    expect(user).to be_invalid
  end
end
