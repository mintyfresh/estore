# frozen_string_literal: true

# This migration comes from ordering (originally 20220304194540)
class CreateOrderingCustomers < ActiveRecord::Migration[7.0]
  def change
    users_table = Ordering.user_class.safe_constantize.table_name

    create_table :ordering_customers do |t|
      t.belongs_to :user, null: false, index: { unique: true }, foreign_key: { to_table: users_table }
      t.timestamp  :first_ordered_at
      t.timestamp  :last_ordered_at
      t.integer    :orders_count, null: false, default: 0
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
