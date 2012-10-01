require "set"

class Wish < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :recommendations

  validates :content, presence: true, uniqueness: true, length: { in: 10..140 }

  private

  after_initialize do |wish|
    wish.rank = 0
    wish.voters = Set.new
  end

  # def add_vote(user)
  #   @voters.add?(user)
  # end

  # def remove_vote(user)
  #   @voters.delete?(user)
  # end

  # def make_fulfilled(gem)
  #   @fulfiller = gem.recommender
  #   @fulfillment = gem
  # end

  # def fulfilled?
  #   !!@fulfillment
  # end

  # def new_recommendation(gem)
  #   @recommendations << gem
  #   gem
  # end
end
