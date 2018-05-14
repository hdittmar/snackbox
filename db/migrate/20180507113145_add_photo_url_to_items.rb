class AddPhotoUrlToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :photo_url, :string
  end
end
