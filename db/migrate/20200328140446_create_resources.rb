class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources, id: :uuid do |t|
      t.references :classroom, type: :uuid, null: false, foreign_key: true
      t.string :url
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
