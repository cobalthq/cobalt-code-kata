global.queue="QUEUE"
Function('j', 't',
global.j=`self=unescape("global.queue=%22QQQ%22%0aFunction('j', 't',%0aglobal.j=ttjjtt)(global.j, 'tt')")
    .replace(/tt/g, t)
    .replace(/jj/g, j)
    .replace('QQQ', 'queue'.toUpperCase())
o_N=unescape('%6e')+unescape('%6e')
o_Q=unescape('%71')+unescape('%71')
o_C=unescape('%63')+unescape('%63')
queue=queue+':'+self.replace(new RegExp(unescape('%0a'), 'g'), o_N)
    .replace(/"/g, o_Q)
    .replace(/:/g, o_C)
index=queue.indexOf(':')
console.log(queue.slice(0, index)
    .replace(new RegExp(o_C, 'g'), ':')
    .replace(new RegExp(o_Q, 'g'), '"')
    .replace(new RegExp(o_N, 'g'), unescape('%0a'))
    .replace('queue'.toUpperCase(), queue.slice(index+1, queue.length)))`)(global.j, '`')
