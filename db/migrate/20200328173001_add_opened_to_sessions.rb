class AddOpenedToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :opened, :boolean, default: false
  end
end
