require "set"

class Wish
  attr_accessor :content, :voters, :fulfillment, :fulfilled_by, :maker

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
    @fulfilled_by = user
    @fulfillment = gem
  end

  def valid?
    @content.size <= 140 ? true : false
  end
end
