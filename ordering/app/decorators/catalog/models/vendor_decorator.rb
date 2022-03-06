# frozen_string_literal: true

Catalog::Vendor.class_eval do
  has_many :purchase_orders, class_name: 'Ordering::PurchaseOrder', inverse_of: :vendor, dependent: :restrict_with_error
end
