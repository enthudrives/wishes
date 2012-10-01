class AddIndexes < ActiveRecord::Migration
  def change
    add_index :wishes, :user_id
    add_index :votes, [:user_id, :wish_id]
    add_index :recommendations, [:user_id, :wish_id]
  end
end
