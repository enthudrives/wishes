require 'active_support/core_ext/object/blank'

class User
  attr_accessor :name, :recommendations
  attr_writer :wish_source, :recommendation_source

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @recommendations ||= []
  end

  def wish_source
    @wish_source ||= Wish.public_method(:new)
  end

  def recommendation_source
    @recommendation_source ||= Rubygem.public_method(:new)
  end

  def valid?
    [name.present?].all?
  end

  def upvote(wish)
    wish.add_upvote(self)
  end

  def downvote(wish)
    wish.add_downvote(self)
  end

  def cancel_vote(wish)
    wish.remove_vote(self)
  end

  def new_wish(attributes = {})
    wish_source.call(attributes.merge(maker: self))
  end

  def new_recommendation(wish, attributes = {})
    recommendation = recommendation_source.call(attributes.merge(recommender: self))
    wish.new_recommendation(recommendation)
  end
end
