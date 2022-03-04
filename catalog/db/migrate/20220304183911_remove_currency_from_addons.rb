# frozen_string_literal: true

class RemoveCurrencyFromAddons < ActiveRecord::Migration[7.0]
  def change
    remove_column :catalog_addons, :currency, :string

    reversible do |dir|
      dir.down do
        execute(<<-SQL.squish)
          UPDATE catalog_addons
             SET currency = catalog_products.currency
            FROM catalog_products
           WHERE catalog_products.id = catalog_addons.product_id
        SQL

        change_column_null :catalog_addons, :currency, false
      end
    end
  end
end
