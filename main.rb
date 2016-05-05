require 'sinatra'
require './mail.rb'
require './git.rb'
require './counter.rb'
require './simian.rb'
require './complexity.rb'

get '/' do
  erb :index
end

post '/confirm/' do
  name = params[:name] || "Hi There"
  kataURL = params[:kataURL] || "Nobody"
  from = params[:from] || "Nowhere"
  test_command = params[:testCommand] || "None"
  to = params[:to] || "mrauh+default@pillartechnology.com"
  extension = params[:extension] || '.rb'

  project_name = git_extract(kataURL)
  git_clone(kataURL)
  Dir.chdir(project_name)
  complexity = count_complexity(extension)
  commit_number = git_count_commits
  number_of_tests = count_all(extension)
  Dir.chdir('../')
  simian_results = run_simian("#{project_name}/*")

  mailto(to, name, kataURL, from, commit_number, simian_results, number_of_tests, test_command, complexity)

  erb :confirmation, :locals => {'name' => name, 'kataURL' => kataURL, 'from' => from}
end
