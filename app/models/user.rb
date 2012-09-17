class User
  def vote(wish)
    wish.add_vote(self)
  end

  def cancel_vote(wish)
    wish.remove_vote(self)
  end

  def fulfill_wish(wish, gem)
    wish.make_fulfilled(self, gem)
  end
end
