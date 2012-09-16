class User
  def upvote(wish)
    unless wish.voters.include?(self)
      wish.rank += 1
      wish.voters << self
    else
      false
    end
  end

  def downvote(wish)
    unless wish.voters.include?(self)
      wish.rank -= 1
      wish.voters << self
    else
      false
    end
  end
end
