class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string      :title, null: false
      t.string      :description, null: false
      t.text        :content, null: false
      t.belongs_to  :user, null: false, type: :uuid
      t.belongs_to  :classroom, null: false, type: :uuid
      t.boolean     :published, null: false, default: false
      t.timestamps
    end

    change_table :classroom_animations do |t|
      t.belongs_to :course, type: :uuid
    end
  end
end
