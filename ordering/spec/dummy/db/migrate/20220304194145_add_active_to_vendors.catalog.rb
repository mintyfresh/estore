# frozen_string_literal: true

# This migration comes from catalog (originally 20220304183851)
class AddActiveToVendors < ActiveRecord::Migration[7.0]
  def change
    add_column :catalog_vendors, :active, :boolean, null: false, default: false
  end
end
