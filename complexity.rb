def count(file_contents)
  complexity = 1
  patterns = [/\Wif\W/, /\Wunless\W/, /\Wwhile\W/, /\Wuntil\W/, /\Wfor\W/,
    /\Welsif\W/, /\Wwhen\W/, /\Wrescue\W/, /\&\&/, /\Wand\W/, /\|\|/, /\Wor\W/,
     /\&\=/, /\|\=/, /\^\=/, /\Wor_eq\W/, /\Wand_eq\W/, /\Wxor_eq\W/,
     /\Wcase\W/, /\Wcatch\W/, /\Wxor\W/, /\Wforeach\W/, /\Wfinally\W/,
     /\W\@catch\(\)\W/, /\W\@finally\W/, /\Welif\W/]
    patterns.each do |pattern|
    complexity += file_contents.scan(pattern).count
  end
    return complexity
end

def count_all(extension)
  total = 0
  Dir.glob("**/*#{extension}").each do |filename|
    current_file = File.read(filename)
    total += count(current_file)
  end
  return total
end
