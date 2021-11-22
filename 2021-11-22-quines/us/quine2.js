s='s=__\nconsole.log(s.replace("__", unescape("%27")+s.replace(unescape("%0a"), unescape("%5c")+"n")+unescape("%27")))'
console.log(s.replace("__", unescape("%27")+s.replace(unescape("%0a"), unescape("%5c")+"n")+unescape("%27")))
