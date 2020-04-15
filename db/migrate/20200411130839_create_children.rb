class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children, id: :uuid do |t|
      t.string      :name, null: false
      t.belongs_to  :classroom, null: false, type: :uuid
      t.belongs_to  :parent, null: false, type: :uuid
      t.timestamps
    end
  end
end
