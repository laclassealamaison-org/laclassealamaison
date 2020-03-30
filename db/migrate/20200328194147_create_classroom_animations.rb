class CreateClassroomAnimations < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_animations, id: :uuid do |t|
      t.references :classroom, null: false, foreign_key: true, type: :uuid
      t.datetime :starts_at
      t.string :live_url
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.boolean :opened, default: false
      t.integer :childrens_maximum, default: 0

      t.timestamps
    end
  end
end
