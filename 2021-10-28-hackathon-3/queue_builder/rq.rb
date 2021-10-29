queue="global.queue=qqQUEUEqqnnFunction('j', 't',nnglobal.j=`self=qqglobal.queue=zzQQQzzxxFunction('j', 't',xxglobal.j=ttjjtt)(global.j, 'tt')qqnn    .replace(/zz/g, unescape('%22'))nn    .replace(/xx/g, unescape('%0a'))nn    .replace(/tt/g, t)nn    .replace(/jj/g, j)nn    .replace('QQQ', 'queue'.toUpperCase())nno_N=unescape('%6e')+unescape('%6e')nno_Q=unescape('%71')+unescape('%71')nno_C=unescape('%63')+unescape('%63')nnqueue=queue+'cc'+self.replace(new RegExp(unescape('%0a'), 'g'), o_N)nn    .replace(/qq/g, o_Q)nn    .replace(/cc/g, o_C)nnindex=queue.indexOf('cc')nnconsole.log(queue.slice(0, index)nn    .replace(new RegExp(o_C, 'g'), 'cc')nn    .replace(new RegExp(o_Q, 'g'), 'qq')nn    .replace(new RegExp(o_N, 'g'), unescape('%0a'))nn    .replace('queue'.toUpperCase(), queue.slice(index+1, queue.length)))`)(global.j, '`'):quine2"
eval r=<<-'RUBY'
slf=%Q(queue="QQQ"
eval r=<<-'RUBY'
#{r}RUBY)
queue+=":#{slf.gsub(10.chr,110.chr*2).gsub(34.chr,113.chr*2).gsub(':',99.chr*2).sub('QQQ','queue'.upcase)}"
index=queue.index(':')
puts queue[0...index].gsub(110.chr*2,10.chr).gsub(113.chr*2,34.chr).gsub(99.chr*2,':').sub('queue'.upcase,queue[(index+1)..])
RUBY
