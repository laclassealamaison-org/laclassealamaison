class AddNameToResource < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :name, :string
  end
end
