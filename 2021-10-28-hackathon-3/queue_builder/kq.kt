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
    val oN=63.toChar().toString()+"n"
    val oq='"'.toString()
    val oQ=63.toChar().toString()+"q"
    val oC=63.toChar().toString()+"c"
    val oS=63.toChar().toString()+"s"
    val ot=9.toChar().toString()
    val oT=63.toChar().toString()+"t"
    val nextQueue=queue+":"+self.replace(":", oC).replace(on, oN).replace(oq, oQ).replace(" ", oS).replace(ot, oT)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oC, ":")
        .replace(oN, on)
        .replace(oQ, oq)
        .replace(oS, " ")
        .replace(oT, ot)
        .replace("queue".uppercase(), arr[1]))
}
""".trim()
    val self=k.format("queue".uppercase(), '"', k, '"')
    val on=10.toChar().toString()
    val oN=63.toChar().toString()+"n"
    val oq='"'.toString()
    val oQ=63.toChar().toString()+"q"
    val oC=63.toChar().toString()+"c"
    val oS=63.toChar().toString()+"s"
    val ot=9.toChar().toString()
    val oT=63.toChar().toString()+"t"
    val nextQueue=queue+":"+self.replace(":", oC).replace(on, oN).replace(oq, oQ).replace(" ", oS).replace(ot, oT)
    val arr=nextQueue.split(":", ignoreCase=false, limit=2)
    println(arr[0]
        .replace(oC, ":")
        .replace(oN, on)
        .replace(oQ, oq)
        .replace(oS, " ")
        .replace(oT, ot)
        .replace("queue".uppercase(), arr[1]))
}
