require 'test/unit'
require '../complexity.rb'

class ComplexityTest < Test::Unit::TestCase

def test_that_ruby_complexity_can_be_counted
  Dir.chdir("../testData/ruby/production")
  total = count_all('.rb')
  Dir.chdir('../../')
  assert_equal 46, total
end

def test_that_cpp_complexity_can_be_counted
  Dir.chdir('../testData/cpp/production')
  total = count_all('.cpp') + count_all('.cc') + count_all('.c++')
  Dir.chdir('../../')
  assert_equal 11, total
end

def test_that_csharp_complexity_can_be_counted
  Dir.chdir('../testData/csharp/production')
  total = count_all('.cs')
  Dir.chdir('../../')
  assert_equal 6, total
end

def test_that_java_complexity_can_be_counted
  Dir.chdir('../testData/java/production')
  total = count_all('.java')
  Dir.chdir('../../')
  assert_equal 15, total
end

def test_that_javascript_complexity_can_be_counted
  Dir.chdir('../testData/javascript/production')
  total = count_all('.js')
  Dir.chdir('../../')
  assert_equal 9, total
end

def test_that_objective_c_complexity_can_be_counted
  Dir.chdir('../testData/objectiveC/production')
  total = count_all('.m')
  Dir.chdir('../../')
  assert_equal 8, total
end

end
