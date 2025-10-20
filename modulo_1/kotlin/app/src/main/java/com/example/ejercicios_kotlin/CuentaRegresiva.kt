fun main() {    
    for (i in 30 downTo 0) {
        when (i) {
            20 -> println("$i - Chequeo de sistemas")
            10 -> println("$i - Ultimos ajustes")
            0 -> println("$i - Despegue")
            else -> println(i)
        }
    }
}