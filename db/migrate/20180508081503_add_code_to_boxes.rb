class AddCodeToBoxes < ActiveRecord::Migration[5.1]
  def change
    remove_column :boxes, :number
    add_column :boxes, :code, :string
  end
end
