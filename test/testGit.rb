require '../git.rb'
require 'test/unit'

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
    Dir.chdir(git_extract(url))
    commits = git_count_commits
    assert_equal commits, 69
    Dir.chdir("../")
    %x`rm -rf RomanNumeralConverter`
  end
end
