queue="QUEUE"
eval r=<<-'RUBY'
slf=%Q(queue="QQQ"
eval r=<<-'RUBY'
#{r}RUBY)
next_quine,next_queue=(queue+":#{slf.gsub(10.chr,110.chr*2).gsub(34.chr,113.chr*2).gsub(':',99.chr*2).sub('QQQ','queue'.upcase)}").split(':',2)
puts next_quine.gsub(110.chr*2,10.chr).gsub(113.chr*2,34.chr).gsub(99.chr*2,':').sub('queue'.upcase,next_queue)
RUBY
