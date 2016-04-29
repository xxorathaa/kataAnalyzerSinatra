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

  project_name = git_extract(kataURL)
  git_clone(kataURL)
  git_cd(project_name)
  commit_number = git_count_commits
  git_cd('../')

  mailto(name, kataURL, from, commit_number)

  erb :confirmation, :locals => {'name' => name, 'kataURL' => kataURL, 'from' => from}
end
