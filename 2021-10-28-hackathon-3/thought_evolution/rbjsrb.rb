eval r = <<-'RUBY'
t = [96].pack("C")
n = [92,110].pack("CC")
self_ = "eval r = <<-'RUBY'#{n}#{r}RUBY"
puts "console.log(#{t}#{self_}#{t})"
RUBY