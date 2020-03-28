class AddChildrensMaximumToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :childrens_maximum, :integer, default: 0
  end
end
