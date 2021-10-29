fun main(){
    val queue="QUEUE"
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
    val oN=92.toChar().toString()+110.toChar()
    val oQ=92.toChar().toString()+34.toChar()
    val oC=99.toChar().toString()+99.toChar()
    val nextQueue=queue+":"+self.replace(":", oC)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oC, ":")
        .replace("queue".uppercase(), arr[1].replace(on, oN).replace('"'.toString(), oQ)))
}
""".trim()
    val self=k.format("queue".uppercase(), '"', k, '"')
    val on=10.toChar().toString()
    val oN=92.toChar().toString()+110.toChar()
    val oQ=92.toChar().toString()+34.toChar()
    val oC=99.toChar().toString()+99.toChar()
    val nextQueue=queue+":"+self.replace(":", oC)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oC, ":")
        .replace("queue".uppercase(), arr[1].replace(on, oN).replace('"'.toString(), oQ)))
}
