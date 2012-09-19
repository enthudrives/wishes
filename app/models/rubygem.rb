class Rubygem
  attr_accessor :name, :ruby_version

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def valid?
    true
  end
end