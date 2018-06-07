class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      # index: true 與資料庫索引有關係
      t.integer :order_id, index: true
      t.string :payment_method
      t.integer :amount
      t.datetime :paid_at
      t.text :params
      t.timestamps
    end
  end
end
