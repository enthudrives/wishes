class User
  def vote(wish)
    unless wish.voters.include?(self)
      wish.rank += 1
      wish.voters << self
    else
      false
    end
  end

  def cancel_vote(wish)
    if wish.voters.include?(self)
      wish.rank -= 1
      wish.voters.delete(self)
    else
      false
    end
  end

  def fulfill(wish, gem)
    wish.fulfillment = gem
    wish.fulfilled_by = self
  end
end
