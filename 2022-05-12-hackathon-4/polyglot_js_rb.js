js = "q = unescape('%22'); console.log('js = ' + q + js + q); console.log('rb = ' + q + rb + q); console.log('0 && eval(rb) && exit'); console.log('eval(js)')"
rb = "q = 34.chr; puts('js = ' + q + js + q); puts('rb = ' + q + rb + q); puts('0 && eval(rb) && exit'); puts('eval(js)'); true"
0 && eval(rb) && exit
eval(js)
