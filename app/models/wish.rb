class Wish < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :recommendations
  has_many :votes

  validates :content, presence: true, uniqueness: true, length: { in: 10..140 }

  def rank
    self.votes.count
  end
end
