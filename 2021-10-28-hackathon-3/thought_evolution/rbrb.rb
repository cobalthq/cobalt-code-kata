eval r = <<-'RUBY'
self_ = "eval r = <<-'RUBY'\n#{r}RUBY"
puts self_
RUBY