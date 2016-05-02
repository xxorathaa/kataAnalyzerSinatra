def count(file_contents)
  possible_patterns = [/>>>/, /def test_/, /it "/, /@Test/, /\[Test\]/, /\[TestMethod\]/, /\(void\)test/, /it\(['"]/]
  max = 0
  possible_patterns.each do |pattern|
    current = file_contents.scan(pattern).count
    if current > max
      max = current
    end
  end
  return max
end

def count_all(extension)
  total = 0
  Dir.glob("**/*#{extension}").each do |filename|
    current_file = File.read(filename)
    total += count(current_file)
  end
  return total
end
