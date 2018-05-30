class AddColumnToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :name, :string
    add_column :order_items, :description, :text
    add_column :order_items, :image, :string
  end
end
