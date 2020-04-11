class CreateClassroomAnimationReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_animation_reservations, id: :uuid do |t|
      t.belongs_to  :classroom_animation, null: false, type: :uuid, index: false
      t.belongs_to  :child, null: false, type: :uuid
      t.integer     :status, null: false, default: 0
      t.timestamps
      t.index :classroom_animation_id, name: 'car_ca_id'
    end
  end
end
