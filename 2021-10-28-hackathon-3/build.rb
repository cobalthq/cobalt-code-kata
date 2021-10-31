quines = [
  "kotlinc queue_builder/kq.kt -include-runtime -d queue_builder/kq.jar && java -jar queue_builder/kq.jar",
  "go run ./queue_builder/gq.go",
  "node queue_builder/jq.js",
]

def cobalt_pad(num)
  str = "cobalt"
  (str*(num/str.length + 1))[0...num]
end

zip = File.readlines("logo.txt").each_with_object([]) do |line, logo_info|
  info = line.chomp.chars.each_with_object({zip: ""}) do |char, line_info|
    current = (char == " ") ? "s" : "c"
    if current == line_info[:prev]
      line_info[:count] += 1
      next
    elsif !line_info[:prev].nil?
      line_info[:zip] = line_info[:zip] + line_info[:count].to_s + line_info[:prev]
    end
    line_info[:prev] = current
    line_info[:count] = 1
  end
  logo_info.push(info[:zip] + info[:count].to_s + info[:prev])
end
File.open("logo_schema.txt", "w") do |f|
  f.write(zip.join("n"))
end
queue = quines.map { |cmd| `#{cmd}`.chomp }.join(":")

main, tail = File.readlines("queue_builder/rq.rb").map(&:chomp).join("").split("buffer")
main.sub!("QUEUE", queue)
index = 0
ascii = zip.each_with_index.inject("") do |acc, (line, i)|
  acc + line.scan(/(\d+)([sc])/).inject("") do |l, (num, char)|
    num = num.to_i
    if char == "s"
      l += " "*num
    elsif index < main.length
      if (index + num) < main.length
        l += main[index, num]
      else
        l = l + main[index..] + cobalt_pad(index + num - main.length - 1)
      end
      index += num
    else
      l += cobalt_pad(num)
    end
    if i == zip.length - 1
      l[0..(-tail.length-1)] + tail
    else
      l
    end
  end + "\n"
end

File.open("main.rb", "w") do |f|
  f.write ascii
end
