require './git.rb'
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

  def test_that_simian_returns_valid_response
    url = 'https://github.com/michaelrauh/RomanNumeralConverter'
    git_clone(url)
    actual = run_simian(git_extract(url))
    expected = "Similarity Analyser 2.4.0 - http://www.harukizaemon.com/simian\nCopyright (c) 2003-2015 Simon Harris.  All rights reserved.\nSimian is not free unless used solely for non-commercial or evaluation purposes.\n{failOnDuplication=true, ignoreCharacterCase=true, ignoreCurlyBraces=true, ignoreIdentifierCase=true, ignoreModifiers=true, ignoreStringCase=true, threshold=2}\nFound 0 duplicate lines in 0 blocks in 0 files\nProcessed a total of 0 significant (0 raw) lines in 0 files\nProcessing time: 0.005sec\n"
    assert_equal expected, actual
  end
end
