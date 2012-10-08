class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.text :content,       null: false
      t.integer :rank
      t.belongs_to :user,    null: false
    end
  end
end
