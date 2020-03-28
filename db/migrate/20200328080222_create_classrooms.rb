class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms, id: :uuid do |t|
      t.string :name
      t.integer :position
      t.string :color
      t.string :videoconference_url
      t.string :ressources_url

      t.timestamps
    end
  end
end
