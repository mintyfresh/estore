# frozen_string_literal: true

class CreateOrderingPurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :ordering_purchase_orders do |t|
      t.belongs_to :sales_order, null: false, foreign_key: { to_table: :ordering_sales_orders }
      t.belongs_to :vendor, null: false, foreign_key: { to_table: :catalog_vendors }
      t.string     :status, null: false
      t.timestamps default: -> { 'NOW()' }

      t.index %i[sales_order_id vendor_id], unique: true
    end
  end
end
