def count(file_contents)
    complexity = file_contents.scan(/if/).count
    return complexity + 1
end

def count_all(extension)
  total = 0
  Dir.glob("**/*#{extension}").each do |filename|
    current_file = File.read(filename)
    total += count(current_file)
  end
  return total
end
