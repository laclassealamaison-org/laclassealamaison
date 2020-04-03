class AddCommentToClassroomAnimations < ActiveRecord::Migration[6.0]
  def change
    add_column :classroom_animations, :comment, :text
  end
end
