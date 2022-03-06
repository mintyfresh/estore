# frozen_string_literal: true

class CreateOrderingSalesOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :ordering_sales_orders do |t|
      t.belongs_to :customer, null: false, foreign_key: { to_table: :ordering_customers }
      t.string     :status, null: false
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
