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
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { maximum: 50 }, presence: true

  has_secure_password

  # @return [String]
  def name
    "#{first_name} #{last_name}"
  end
end
