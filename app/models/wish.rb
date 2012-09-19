require "set"

class Wish
  attr_accessor :content, :voters, :fulfillment, :fulfiller, :maker

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @voters ||= Set.new
  end

  def fulfilled?
    !!@fulfillment
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

  def make_fulfilled(user, gem)
    @fulfiller = user
    @fulfillment = gem
  end

  def valid?
    [@content.size.between?(10, 140)].all?
  end
end
