require 'test/unit'
require '../complexity.rb'

class ComplexityTest < Test::Unit::TestCase

def test_that_ruby_complexity_can_be_counted
  Dir.chdir("../testData/ruby/production")
  total = count_all('.rb')
  assert_equal 46, total
  Dir.chdir('../../../')
end

def test_that_cpp_complexity_can_be_counted
  Dir.chdir('../testData/cpp/production')
  total = count_all('.cpp') + count_all('.cc') + count_all('.c++')
  assert_equal 11, total
  Dir.chdir('../../')
end
end
