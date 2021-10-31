global.queue="QUEUE"
Function('j', 't',
global.j=`self=unescape("global.queue=%22QQQ%22%0aFunction('j', 't',%0aglobal.j=ttjjtt)(global.j, 'tt')")
    .replace(/tt/g, t)
    .replace(/jj/g, j)
    .replace('QQQ', 'queue'.toUpperCase())
o_N=unescape('%3f%6e')
o_Q=unescape('%3f%71')
o_C=unescape('%3f%63')
o_S=unescape('%3f%73')
o_T=unescape('%3f%74')
queue=(queue+':'+self.replace(new RegExp(unescape('%0a'), 'g'), o_N)
    .replace(/"/g, o_Q)
    .replace(/:/g, o_C)
    .replace(/ /g, o_S)
    .replace(new RegExp(unescape('%09'), 'g'), o_T))
arr=queue.split(":")
nextQuine=arr[0]
nextQueue=arr.slice(1).join(":")
schema='145cn145cn145cn145cn145cn145cn145cn145cn145cn75c6s64cn62c32s51cn56c44s45cn51c53s41cn48c60s37cn45c31s4c31s34cn42c34s4c34s31cn40c18s3c15s4c15s3c17s30cn38c20s5c9s11c11s4c16s31cn36c24s4c1s26c1s4c15s34cn34c26s36c12s37cn33c24s42c6s40cn32c13s1c9s90cn31c13s7c2s92cn30c18s97cn29c21s20c16s59cn29c20s18c22s56cn28c20s17c26s54cn28c20s16c28s53cn28c19s20c7s8c11s52cn28c11s31c3s10c10s52cn28c19s20c7s8c11s52cn28c19s17c13s2c13s53cn28c20s17c26s54cn29c20s18c22s56cn29c21s19c18s58cn30c19s26c6s64cn31c14s100cn32c13s3c6s91cn33c23s44c4s41cn34c25s38c10s38cn36c24s36c14s35cn37c22s4c6s18c6s4c16s32cn39c19s4c14s4c14s4c17s30cn41c35s4c35s30cn44c32s4c32s33cn47c62s36cn50c56s39cn55c46s44cn60c36s49cn69c18s58cn145cn145cn145cn145cn145cn145cn145cn145cn145c'.split('n')
nextQuine=nextQuine
    .replace(new RegExp(unescape('%5c')+o_N, 'g'), unescape('%0a'))
    .replace(new RegExp(unescape('%5c')+o_Q, 'g'), '"')
    .replace(new RegExp(unescape('%5c')+o_C, 'g'), ':')
    .replace(new RegExp(unescape('%5c')+o_S, 'g'), ' ')
    .replace(new RegExp(unescape('%5c')+o_T, 'g'), unescape('%09'))
    .replace('queue'.toUpperCase(), nextQueue)
var index=0
padding=(str,num)=>{
    re = str
    while(re.length<num) {
        re += str
    }
    return re.slice(0,num)
}
ascii=schema.reduce((acc, line, i)=>{
    part=line.match(/[0-9]+[cs]/g).reduce((l, mtch)=>{
        num = parseInt(mtch.slice(0,-1))
        if (mtch.slice(-1)=='s') {
            l+=padding(' ',num)
        } else {
            l+=nextQuine.slice(index,index+num)
            index+=num
        }
        return l
    }, '')
    return acc+part+(i==schema.length-1 ? '' :unescape('%0a'))
}, '')
queue.slice(0,5)=='queue'.toUpperCase() ? console.log(nextQuine) : console.log(ascii)`)(global.j, '`')
