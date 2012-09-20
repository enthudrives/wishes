require "active_support/core_ext/object/blank"

class User
  attr_accessor :name, :wish_source, :recommendations, :recommendation_source

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @wish_source ||= Wish.public_method(:new)
    @recommendation_source ||= Rubygem.public_method(:new)
    @recommendations ||= []
  end

  def valid?
    [name.present?].all?
  end

  def vote(wish)
    wish.add_vote(self)
  end

  def cancel_vote(wish)
    wish.remove_vote(self)
  end

  def new_wish(attributes = {})
    wish_source.call(attributes.merge(maker: self))
  end

  def new_recommendation(wish, attributes = {})
    recommendation = @recommendation_source.call(attributes.merge(recommender: self))
    wish.new_recommendation(recommendation)
  end
end
