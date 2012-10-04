require "set"
require "active_attr"

class Wish
  include ActiveAttr::Model
  attr_accessor :content, :voters, :fulfillment, :fulfiller, :maker, :recommendations

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @voters ||= Set.new
    @recommendations ||= []
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

  def to_param
    1
  end
end
