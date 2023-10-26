class RenameCustomerColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :customer, :customer_id
  end
end
