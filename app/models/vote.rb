class Vote < ActiveRecord::Base
  attr_accessible :wish_id

  belongs_to :user
  belongs_to :wish

  validates :wish_id, uniqueness: { scope: :user_id, message: 'You already voted for this wish'  }
end