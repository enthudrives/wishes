ROOT = File.expand_path("../", File.dirname(__FILE__))
Dir["#{ROOT}/spec/support/**/*.rb"].each {|f| require f}

require "debugger"

require "factory_girl_rails"
require "#{ROOT}/spec/factories"

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Mix-in FG's methods so you don't have to call FactoryGirl in the tests
  # http://robots.thoughtbot.com/post/19162390206/short-explicit-test-setups
  config.include FactoryGirl::Syntax::Methods
end
