class Fulfillment
  attr_accessor :gem_name

  def initialize(user, wish)
    @user = user
    @wish = wish
  end
end