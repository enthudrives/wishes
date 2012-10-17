class ChangeWishContentToString < ActiveRecord::Migration
  def change
    change_column :wishes, :content, :string, null: false
  end
end
