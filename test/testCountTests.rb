require 'test/unit'
require '../counter.rb'

class TestCounterTest < Test::Unit::TestCase

  def test_that_ruby_test_counter_can_count_tests_in_a_single_ruby_file
    single_test = File.read("testData/ruby/singleCase.rb")
    assert_equal count(single_test), 1
  end

  def test_that_we_can_fetch_and_count_multiple_files
    total = 0
    Dir.glob('testData/ruby/*.rb').each do |filename|
      current_file = File.read(filename)
      total += count(current_file)
    end
    assert_equal 3, total
  end

  def test_that_count_all_can_count_all_ruby_files
    Dir.chdir("../testData/ruby")
    total = count_all('.rb')
    Dir.chdir("../../")
    assert_equal 3, total
  end

  def test_that_python_files_can_be_counted
    Dir.chdir("testData/python")
    total = count_all('.py')
    Dir.chdir("../../")
    assert_equal 2, total
  end

  def test_that_doctest_can_be_counted
    Dir.chdir('testData/doctest')
    total = count_all('.py')
    Dir.chdir("../../")
    assert_equal 9, total
  end

  def test_that_rspec_can_be_counted
    Dir.chdir('testData/rspec')
    total = count_all('.rb')
    Dir.chdir('../../')
    assert_equal 3, total
  end

  def test_that_java_can_be_counted
    Dir.chdir('testData/java')
    total = count_all('.java')
    Dir.chdir('../../')
    assert_equal 2, total
  end

  def test_that_NUnit_can_be_counted
    Dir.chdir('../testData/NUnit')
    total = count_all('.cs')
    Dir.chdir('../')
    assert_equal 21, total
  end

  def test_that_c_sharp_unit_tests_can_be_counted
    Dir.chdir('../testData/csharp')
    total = count_all('.cs')
    Dir.chdir('../')
    assert_equal 2, total
  end

  def test_that_objective_c_unit_tests_can_be_counted
    Dir.chdir('testData/objectiveC')
    total = count_all('.m')
    Dir.chdir('../../')
    assert_equal 2, total
  end

  def test_that_mocha_and_jasmine_are_supported
    Dir.chdir('testData/javascript')
    total = count_all('.js')
    Dir.chdir('../../')
    assert_equal 5, total
  end

  def test_that_swift_is_supported
    Dir.chdir('testData/swift')
    total = count_all('.swift')
    Dir.chdir('../../')
    assert_equal 4, total
  end
end
