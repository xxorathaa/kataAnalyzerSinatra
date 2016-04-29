require 'pony'

def mailto(name, url, from, commit_number, test_results, simian_results)
  Pony.mail(to: 'mrauh@pillartechnology.com', from: from, subject: "Kata submission from #{name}", body: "The project at #{url} has #{commit_number} commits\n\nTest Results: #{test_results}\n Simian Results are: #{simian_results}")
end
