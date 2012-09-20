require 'gems'

class Rubygem
  attr_accessor :name

  def initialize(name)
    raise 'Blank gem name given' if name.blank?
    raise 'Gem not found' unless Gems.info(name)
    @name = name
  end

  def valid?
    !!Gems.info(self.name)
  end
end