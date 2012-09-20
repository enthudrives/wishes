require "set"

class Wish
  attr_accessor :content, :voters, :fulfillment, :fulfiller, :maker, :recommendations

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @voters ||= Set.new
    @recommendations ||= Set.new
  end

  def rank
    @voters.count
  end

  def add_vote(user)
    @voters.add?(user)
  end

  def remove_vote(user)
    @voters.delete?(user)
  end

  def make_fulfilled(gem)
    @fulfiller = gem.recommender
    @fulfillment = gem
  end

  def fulfilled?
    !!@fulfillment
  end

  def valid?
    [@content.size.between?(10, 140)].all?
  end

  def new_recommendation(gem)
    @recommendations << gem
    gem
  end
end
