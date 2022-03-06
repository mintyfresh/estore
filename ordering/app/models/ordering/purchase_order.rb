# frozen_string_literal: true

# == Schema Information
#
# Table name: ordering_purchase_orders
#
#  id             :bigint           not null, primary key
#  sales_order_id :bigint           not null
#  vendor_id      :bigint           not null
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ordering_purchase_orders_on_sales_order_id                (sales_order_id)
#  index_ordering_purchase_orders_on_sales_order_id_and_vendor_id  (sales_order_id,vendor_id) UNIQUE
#  index_ordering_purchase_orders_on_vendor_id                     (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (sales_order_id => ordering_sales_orders.id)
#  fk_rails_...  (vendor_id => catalog_vendors.id)
#
module Ordering
  class PurchaseOrder < ApplicationRecord
    STATUSES = %w[submitted accepted rejected completed cancelled].freeze

    belongs_to :sales_order, class_name: 'Ordering::SalesOrder', inverse_of: :purchase_orders
    belongs_to :vendor, class_name: 'Catalog::Vendor', inverse_of: :purchase_orders

    has_many :order_items, class_name: 'Ordering::OrderItem',
             dependent: :restrict_with_error, inverse_of: :purchase_order

    enum :status, STATUSES.index_with(&:itself)

    validates :status, :order_items, presence: true
  end
end
