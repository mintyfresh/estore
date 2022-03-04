# frozen_string_literal: true

# This migration comes from catalog (originally 20220304154242)
class CreateCatalogVendors < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'citext'

    create_table :catalog_vendors do |t|
      t.belongs_to :owner, null: false
      t.citext     :name, null: false, index: { unique: true }
      t.string     :description
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
