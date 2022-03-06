# frozen_string_literal: true

class CreateOrderingOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ordering_order_items do |t|
      t.belongs_to :purchase_order, null: false, foreign_key: { to_table: :ordering_purchase_orders }
      t.belongs_to :product, null: false, foreign_key: { to_table: :catalog_products }
      t.string     :name, null: false
      t.string     :description
      t.integer    :price_cents, null: false
      t.string     :currency, null: false
      t.integer    :quantity, null: false
      t.timestamps default: -> { 'NOW()' }

      t.index %i[purchase_order_id product_id], unique: true

      t.check_constraint 'price_cents >= 0'
      t.check_constraint 'quantity > 0'
    end
  end
end
