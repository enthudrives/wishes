class Vote < ActiveRecord::Base
  attr_accessible :wish_id

  belongs_to :user
  belongs_to :wish

  validates :wish_id, uniqueness: { scope: :user_id, message: 'You already voted for this wish' }

  private

  before_create do |vote|
    vote.wish.increment!(:rank, by = 1)
  end

  before_destroy do |vote|
    vote.wish.decrement!(:rank, by = 1)
  end
end