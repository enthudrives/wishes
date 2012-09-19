class Rubygem
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def valid?
    true
  end
end