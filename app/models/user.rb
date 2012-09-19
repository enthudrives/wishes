class User
  attr_writer :wish_source
  attr_accessor :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def wish_source
    @wish_source ||= Wish.public_method(:new)
  end

  def vote(wish)
    wish.add_vote(self)
  end

  def cancel_vote(wish)
    wish.remove_vote(self)
  end

  def fulfill_wish(wish, gem_name)
    gem = Rubygem.new(gem_name)

    if gem.valid?
      wish.make_fulfilled(self, gem)
    else
      raise "Couldn't find gem"
    end
  end

  def new_wish(attributes = {})
    wish_source.call(attributes.merge(maker: self))
  end
end
