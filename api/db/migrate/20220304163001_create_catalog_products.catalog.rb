# frozen_string_literal: true

# This migration comes from catalog (originally 20220304155724)
class CreateCatalogProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :catalog_products do |t|
      t.belongs_to :vendor, null: false, foreign_key: { to_table: :catalog_vendors }
      t.string     :name, null: false
      t.string     :description
      t.integer    :price_cents, null: false
      t.string     :currency, null: false
      t.timestamps default: -> { 'NOW()' }

      t.check_constraint 'price_cents >= 0'
    end
  end
end
