fun main() {
    println("Ingrese la hora actual (0-23):")
    val hora = readln().toIntOrNull() ?: 0
    
    println("Ingrese su rol (admin, invitado, empleado):")
    val rol = readln().lowercase()
    
    if (hora !in 0..23) {
        println("Hora fuera de rango ingrese un valor entre 0 y 23.")
        return
    }
    
    val acceso = when (rol) {
        "admin" -> true
        "invitado" -> hora in 9..17
        "empleado" -> hora in 6..20
        else -> false
    }
    
    val resultado = if (acceso) "Permitido" else "Denegado"
    println("Acceso: $resultado")
}
