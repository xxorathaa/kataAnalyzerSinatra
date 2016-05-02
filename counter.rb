def count(file_contents)
  file_contents.scan(/def test_/).count
end
