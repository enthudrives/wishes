require "active_attr"
require_relative "vote"

class Wish
  include ActiveAttr::Model
  attr_accessor :content, :votes, :fulfillment, :fulfiller, :maker, :recommendations

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @votes ||= VoteSet.new
    @recommendations ||= []
  end

  def rank
    @votes.map(&:value).inject(0, :+)
  end

  def voters
    @votes.map(&:voter)
  end

  def add_upvote(user)
    @votes << Vote.new(object: self, voter: user, value: 1)
  end

  def add_downvote(user)
    @votes << Vote.new(object: self, voter: user, value: -1)
  end

  def remove_vote(user)
    @votes.delete_from_user(user)
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
