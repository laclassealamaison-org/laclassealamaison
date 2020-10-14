class CreateProgressCards < ActiveRecord::Migration[6.0]
  def change
    create_table :progress_cards, id: :uuid do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :child, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
