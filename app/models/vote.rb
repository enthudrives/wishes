class Vote < ActiveRecord::Base
  attr_accessible :wish_id

  belongs_to :user
  belongs_to :wish

  validates :wish_id, uniqueness: { scope: :user_id, message: 'You already voted for this wish' }

  private

  before_create do |vote|
    current_rank = vote.wish.rank
    vote.wish.update_attribute(:rank, current_rank + 1)
  end

  before_destroy do |vote|
    current_rank = vote.wish.rank
    vote.wish.update_attribute(:rank, current_rank - 1)
  end
end