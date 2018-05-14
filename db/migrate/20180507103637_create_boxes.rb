class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.integer :number
      t.references :user, foreign_key: true
      t.string :kind

      t.timestamps
    end
  end
end
