# frozen_string_literal: true

class CreateMockUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :mock_users do |t|
      t.string :name, null: false
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
