fun main() {    
    println("Ingrese la temperatura actual en Cº:")
    val temperatura = readln().toFloatOrNull() ?: 0f
    
    println("Ingrese su preferencia (frio, templado o caliente):")
    val preferencia = readln().lowercase()
    
    val accion = when {
        preferencia == "frio" && temperatura > 22 -> "Encender aire"
        preferencia == "caliente" && temperatura < 18 -> "Encender calefaccion"
        preferencia == "templado" && temperatura in 18.0..22.0 -> "En confort"
        else -> "Ventilar"
    }
    println("Accion recomendada: $accion")
}
