
fun main() {
    println("Ingrese la distancia del envio (km):")
    val distancia = readln().toIntOrNull() ?: 0
    
    println("¿Esta lloviendo? ingrese (si/no):")
    val lluvia = readln().lowercase() == "si"
    
    val costoBase = when {
        distancia <= 5 -> 2.5
        distancia in 6..15 -> 5.0
        else -> 8.0
    }    
    val costoAdicional = if (lluvia) 1.5 else 0.0
    val costoTotal = costoBase + costoAdicional    
    println("Costo total: $costoTotal")
}
