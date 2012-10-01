class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.text :content,       null: false
      t.integer :rank,       null: false
      t.belongs_to :user_id, null: false
    end

    add_index :wishes, :user_id
  end
end
