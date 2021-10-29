global.queue="QUEUE"
Function('j', 't',
global.j=`self=unescape("global.queue=%22QQQ%22%0aFunction('j', 't',%0aglobal.j=ttjjtt)(global.j, 'tt')")
    .replace(/tt/g, t)
    .replace(/jj/g, j)
    .replace('QQQ', 'queue'.toUpperCase())
o_N=unescape('%5c%6e')
o_Q=unescape('%5c%22')
o_C=unescape('%63%63')
queue=(queue+':'+self.replace(/:/g, o_C))
arr=queue.split(":")
nextQuine=arr[0]
nextQueue=arr.slice(1).join(":")
console.log(nextQuine
    .replace(new RegExp(o_C, 'g'), ':')
    .replace('queue'.toUpperCase(), nextQueue.replace(/"/g, o_Q).replace(new RegExp(unescape('%0a'), 'g'), o_N)))`)(global.j, '`')
