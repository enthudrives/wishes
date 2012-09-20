require "active_support/core_ext/object/blank"

class User
  attr_accessor :name, :wish_source

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @wish_source ||= Wish.public_method(:new)
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

  def fulfill_wish(wish, gem)
    wish.make_fulfilled(self, gem)
  end

  def new_wish(attributes = {})
    wish_source.call(attributes.merge(maker: self))
  end
end
