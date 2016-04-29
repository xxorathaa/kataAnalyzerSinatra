require 'pony'

def mailto(name, url, from, commit_number)
  Pony.mail(to: 'mrauh@pillartechnology.com', from: from, subject: "Kata submission from #{name}", body: "The project at #{url} has #{commit_number} commits")
end
