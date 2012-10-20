class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.belongs_to :wish
      t.belongs_to :user
      t.timestamps
    end
  end
end
