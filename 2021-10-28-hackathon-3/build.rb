quines = [
  "kotlinc queue_builder/kq.kt -include-runtime -d queue_builder/kq.jar && java -jar queue_builder/kq.jar",
  "go run ./queue_builder/gq.go",
  "node queue_builder/jq.js",
]

queue = quines.map { |cmd| `#{cmd}`.chomp }.join(":")

main = File.read("queue_builder/rq.rb")
File.open("main1.rb", "w") do |f|
  f.write main.sub("QUEUE", queue)
end
