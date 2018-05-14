class CreateJoinTableBoxItem < ActiveRecord::Migration[5.1]
  def change
    create_join_table :boxes, :items do |t|
      # t.index [:box_id, :item_id]
      # t.index [:item_id, :box_id]
    end
  end
end
