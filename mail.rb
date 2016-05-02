require 'pony'

def mailto(to, name, url, from, commit_number, test_results, simian_results, number_of_tests)
  Pony.mail(to: to, from: from, subject: "Kata submission from #{name}", body: "The project at #{url} has #{commit_number} commits\n\nNumber of tests: #{number_of_tests}\n\nTest Results: #{test_results}\n Simian Results are: #{simian_results}")
end
