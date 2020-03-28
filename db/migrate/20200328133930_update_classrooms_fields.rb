class UpdateClassroomsFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :classrooms, :videoconference_url
    remove_column :classrooms, :ressources_url
  end
end
