class RemoveImgUrlFromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :img_url
  end
end
