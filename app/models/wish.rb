require "set"

class Wish
  attr_reader :content, :voters, :fulfillment, :fulfilled_by

  def initialize(attributes)
    attributes.each do |name, value|
      instance_variable_set("@#{name}", value)
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
    conditions = [@content.size <= 140]
    if conditions.all?
      true
    else
      false
    end
  end
end
