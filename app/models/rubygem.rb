require 'gems'

class Rubygem
  attr_accessor :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def valid?
    return false if self.name.blank?
    !!Gems.info(self.name)
  end
end