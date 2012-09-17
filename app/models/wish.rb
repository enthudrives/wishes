class Wish
  attr_accessor :content
  attr_writer :rank, :voters, :fulfillment

  def initialize(content)
    @content = content.to_s
  end

  def rank
    @rank ||= 0
  end

  def voters
    @voters ||= []
  end

  def fulfillment
    @fulfillment ||= nil
  end

  def fulfilled?
    !!@fulfillment
  end
end
