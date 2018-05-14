class AddCategoryToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :category
    add_reference :items, :category, foreign_key: true
  end
end
