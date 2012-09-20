require 'gems'
require "active_support/core_ext/object/blank"

class Rubygem
  attr_accessor :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def valid?
    [Gems.info(name), name.present?].all?
  end
end
