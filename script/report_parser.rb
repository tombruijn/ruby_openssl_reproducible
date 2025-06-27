require "json"
json = JSON.parse(File.read("#{ARGV[0]}/ext/install.report"))
message = json["result"]["message"]
puts message
puts JSON.pretty_generate(json)
