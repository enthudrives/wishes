require 'gems'

class Rubygem
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def valid?
    !!Gems.info(self.name)
  end
end