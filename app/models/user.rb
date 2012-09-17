class User
  attr_writer :wish_source
  def wish_source
    @wish_source ||= Wish.public_method(:new)
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
