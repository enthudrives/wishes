
"SET!!!"

class Wish
  attr_reader :content, :rank, :voters, :fulfillment, :fulfilled_by

  def initialize(attributes)
    attributes.each do |name, value|
      instance_variable_set("@#{name}", value)
    end

    @rank ||= 0
    @voters ||= []
  end

  def fulfilled?
    !!fulfillment
  end

  def add_vote(user)
    unless @voters.include?(user)
      @rank += 1
      @voters << user
      true
    else
      false
    end
  end

  def remove_vote(user)
    if @voters.include?(user)
      @rank -= 1
      @voters.delete(user)
      true
    else
      false
    end
  end

  def make_fulfilled(user, gem)
    @fulfilled_by = user
    @fulfillment = gem
  end
end
