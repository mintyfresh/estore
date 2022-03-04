# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'citext'

    create_table :users do |t|
      t.citext :email, null: false, index: { unique: true }
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.binary :password_digest, null: false
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
