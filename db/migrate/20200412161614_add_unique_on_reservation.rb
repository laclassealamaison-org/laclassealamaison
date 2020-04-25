class AddUniqueOnReservation < ActiveRecord::Migration[6.0]
  def change
    add_index :classroom_animation_reservations, %i[child_id classroom_animation_id], unique: true, name: :unique_reservation_idx
  end
end
