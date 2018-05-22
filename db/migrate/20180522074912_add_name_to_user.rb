class AddNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, unique: true, default: "", null: false
    add_column :users, :role, :string, default: "Normal"
  end
end
