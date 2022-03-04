# frozen_string_literal: true

class CreateCatalogAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :catalog_addons do |t|
      t.belongs_to :product, null: false, foreign_key: { to_table: :catalog_products }
      t.citext     :name, null: false
      t.string     :description
      t.integer    :extra_price_cents, null: false
      t.string     :currency, null: false
      t.timestamps default: -> { 'NOW()' }

      t.check_constraint 'extra_price_cents >= 0'
    end
  end
end
