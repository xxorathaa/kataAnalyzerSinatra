def run_simian(files)
  %x(java -jar simian-2.4.0.jar -threshold=2 #{files} 2>&1)
end
