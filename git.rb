def git_clone (url)
  %x(git clone #{url})
end

def git_cd(directory)
  Dir.chdir(directory)
end

def git_count_commits
  commits = %x(git rev-list --all --count)
  return commits.to_i
end

def git_extract(url)
  url.split('/')[-1]
end
