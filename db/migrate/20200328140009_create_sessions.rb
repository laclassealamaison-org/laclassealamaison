class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :classroom, type: :uuid, null: false, foreign_key: true
      t.datetime :scheduled_dt
      t.string :live_url
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
