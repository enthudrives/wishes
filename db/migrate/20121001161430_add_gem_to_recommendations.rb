class AddGemToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :gem, :string, null: false
  end
end
