class AddClassroomAnimationReservationsCountToClassroomAnimation < ActiveRecord::Migration[6.0]
  def change
    add_column :classroom_animations, :classroom_animation_reservations_count, :integer, default: 0, null: false
  end
end
