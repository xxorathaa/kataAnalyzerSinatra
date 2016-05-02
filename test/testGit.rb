require '../git.rb'
require 'test/unit'
require '../counter.rb'

class GitTest < Test::Unit::TestCase

  def test_that_clone_fetches_repository
    git_clone('https://github.com/michaelrauh/RomanNumeralConverter')
    assert File.directory?('RomanNumeralConverter'), "Directory was not created on Git pull"
    %x`rm -rf RomanNumeralConverter`
  end

  def test_that_git_extract_gives_project_name_from_url
    name = git_extract('https://github.com/michaelrauh/RomanNumeralConverter')
    assert_equal name, 'RomanNumeralConverter'
  end

  def test_that_count_commits_gives_correct_number_of_commits
    url = 'https://github.com/michaelrauh/RomanNumeralConverter'
    git_clone(url)
    git_cd(git_extract(url))
    commits = git_count_commits
    assert_equal commits, 69
    git_cd("../")
    %x`rm -rf RomanNumeralConverter`
  end

  def test_that_unit_test_command_returns_correct_text
    url = 'https://github.com/michaelrauh/RomanNumeralConverter'
    git_clone(url)
    git_cd(git_extract(url))
    test_response = run_tests("python number_converter_test.py")
    git_cd("../")
    expected_response = ".......................\n----------------------------------------------------------------------\nRan 23 tests in 0.001s\n\nOK\n"
    assert_equal expected_response, test_response
  end

  def test_that_ruby_test_counter_can_count_tests_in_a_single_ruby_file
    single_test = File.read("../testData/ruby/singleCase.rb")
    assert_equal count(single_test), 1
  end

  def test_that_we_can_fetch_and_count_multiple_files
    total = 0
    Dir.glob('../testData/ruby/*.rb').each do |filename|
      current_file = File.read(filename)
      total += count(current_file)
    end
    assert_equal total, 3
  end

end
