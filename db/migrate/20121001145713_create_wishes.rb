class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.text :content,       null: false
      t.integer :rank,       null: false
      t.belongs_to :user,    null: false
      t.timestamps
    end
  end
end
