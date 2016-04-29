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

def run_tests(command)
  %x(#{command} 2>&1)
end

def run_simian(files)
  %x(java -jar simian-2.4.0.jar -threshold=2 #{files} 2>&1)
end
