fun main(){
    val queue="next_quine(QUEUE):quine2"
    val k=
"""
fun main(){
    val queue="%s"
    val k=
""%c
%s
""%c.trim()
    val self=k.format("queue".uppercase(), '"', k, '"')
    val on=10.toChar().toString()
    val oN=110.toChar().toString()+110.toChar()
    val oQ=113.toChar().toString()+113.toChar()
    val oC=99.toChar().toString()+99.toChar()
    val nextQueue=queue+":"+self
        .replace(on, oN)
        .replace('"'.toString(), oQ)
        .replace(":", oC)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oN, on)
        .replace(oQ, '"'.toString())
        .replace(oC, ":")
        .replace("queue".uppercase(), arr[1]))
}
""".trim()
    val self=k.format("queue".uppercase(), '"', k, '"')
    val on=10.toChar().toString()
    val oN=110.toChar().toString()+110.toChar()
    val oQ=113.toChar().toString()+113.toChar()
    val oC=99.toChar().toString()+99.toChar()
    val nextQueue=queue+":"+self
        .replace(on, oN)
        .replace('"'.toString(), oQ)
        .replace(":", oC)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oN, on)
        .replace(oQ, '"'.toString())
        .replace(oC, ":")
        .replace("queue".uppercase(), arr[1]))
}
