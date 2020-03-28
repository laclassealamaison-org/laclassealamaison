class RemoveNotNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null :sessions, :user_id, true
  end
end
