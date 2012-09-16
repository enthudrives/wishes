class Wish
  attr_writer :rank
  def rank
    @rank ||= 0
  end

  def votes_count
    voters.count
  end

  attr_writer :voters
  def voters
    @voters ||= []
  end
end
