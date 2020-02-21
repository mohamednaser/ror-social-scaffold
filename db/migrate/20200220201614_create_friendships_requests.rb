class CreateFriendshipsRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships_requests do |t|
      t.references :user , index: true, foreign_key: true
      t.references :friend 
      t.boolean :status      
      t.timestamps
    end
    add_foreign_key :friendships_requests, :users, column: :friend_id

  end
end
