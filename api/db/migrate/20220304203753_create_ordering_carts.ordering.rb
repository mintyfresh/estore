# frozen_string_literal: true

# This migration comes from ordering (originally 20220304195141)
class CreateOrderingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :ordering_carts do |t|
      t.belongs_to :customer, null: false, foreign_key: { to_table: :ordering_customers }
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
