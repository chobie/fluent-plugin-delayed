require 'pp'
require 'test/unit'
require 'fluent/test'
require 'fluent/plugin/out_delayed'

class DealyedOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end
  
  CONFIG = %[
    type delayed
  ]
  
  def create_driver(conf=CONFIG)
    Fluent::Test::OutputTestDriver.new(Fluent::DelayedOutput).configure(conf)
  end
  
  def test_configure
    d = create_driver
  end

  def test_delayed
    d = create_driver
    
    time = Time.parse("2011-01-02 13:14:15 UTC").to_i
    Fluent::Engine.now = time
 
# Todo: i'm not sure how does these lines work. let me look around these if i have a chance.
#     
#    d.expect_emit "tag1", time, {"message"=>"hello"}
#    
#    d.run do
#      d.expected_emits.each { |tag, time, record|
#        assert_equal tag, "tag1"
#      }
#    end
  end
  
end