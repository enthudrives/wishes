require 'gems'

class Rubygem
  attr_accessor :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # This will be provided for us automatically by ActiveRecord
  def name?
    name != nil and not name.empty?
  end

  def valid?
    [Gems.info(name), name?].all?
  end
end
