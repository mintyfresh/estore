# frozen_string_literal: true

class AddActiveToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :catalog_products, :active, :boolean, null: false, default: false
  end
end
