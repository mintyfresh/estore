# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamp  :expires_at, null: false
      t.timestamp  :revoked_at
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
