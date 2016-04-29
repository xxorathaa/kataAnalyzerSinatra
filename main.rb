require 'sinatra'
require './mail.rb'
require './git.rb'

get '/' do
  erb :index
end

post '/confirm/' do
  name = params[:name] || "Hi There"
  kataURL = params[:kataURL] || "Nobody"
  from = params[:from] || "Nowhere"
  test_command = params[:testCommand] || "None"

  project_name = git_extract(kataURL)
  git_clone(kataURL)
  git_cd(project_name)
  commit_number = git_count_commits
  test_results = run_tests(test_command)
  git_cd('../')
  simian_results = run_simian("#{project_name}/*")

  mailto(name, kataURL, from, commit_number, test_results, simian_results)

  erb :confirmation, :locals => {'name' => name, 'kataURL' => kataURL, 'from' => from}
end
