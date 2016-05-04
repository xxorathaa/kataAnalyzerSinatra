require 'test/unit'
require '../complexity.rb'

class ComplexityTest < Test::Unit::TestCase

def test_that_ruby_complexity_can_be_counted
  Dir.chdir("../testData/ruby/production")
  total = count_all('.rb')
  assert_equal 43, total
end
end
