class ChangeStatusColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :friendships_requests, :status, "integer USING CAST(status AS integer)"
  end
end
