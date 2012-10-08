class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :uid, unique: true, name: 'by_uid'
  end
end
