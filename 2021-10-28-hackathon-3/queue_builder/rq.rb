queue="QUEUE"
eval r=<<-'RUBY'
slf=%Q(queue="QQQ"
eval r=<<-'RUBY'
#{r}RUBY)
next_quine,next_queue=(queue+":#{slf.gsub(':',99.chr*2).sub('QQQ','queue'.upcase)}").split(':',2)
puts next_quine.gsub(99.chr*2,':').sub('queue'.upcase,next_queue.gsub(10.chr,92.chr+110.chr).gsub(34.chr,92.chr+34.chr))
RUBY
