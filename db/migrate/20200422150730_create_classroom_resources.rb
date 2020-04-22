class CreateClassroomResources < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_resources, id: :uuid do |t|
      t.references :classroom, null: false, foreign_key: true, type: :uuid
      t.references :resource, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
