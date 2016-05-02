require 'git'

def git_clone (url)
  project_name = git_extract(url)
  unless Dir.glob('*').include?(project_name)
    Git.clone(url, project_name)
  end
end

def git_count_commits
  commits = %x(git rev-list --all --count)
  return commits.to_i
end

def git_extract(url)
  url.split('/')[-1]
end
