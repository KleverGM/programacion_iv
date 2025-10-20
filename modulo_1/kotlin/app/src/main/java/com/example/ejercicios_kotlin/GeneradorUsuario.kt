fun main() {    
    println("Ingrese su nombre:")
    val nombre = readln().lowercase().replace(" ", "")
    
    println("Ingrese su apellido:")
    val apellido = readln().lowercase().replace(" ", "")
    
    if (nombre.isEmpty() || apellido.isEmpty()) {
        println("Error su nombre y apellido no pueden estar vacios.")
        return
    }
    
    val username = StringBuilder()
    var indexNombre = 0
    var indexApellido = 0
    
    while (indexNombre < nombre.length || indexApellido < apellido.length) {
        for (i in 0 until 2) {
            if (indexNombre < nombre.length) {
                username.append(nombre[indexNombre])
                indexNombre++
            }
        }
        
        for (i in 0 until 2) {
            if (indexApellido < apellido.length) {
                username.append(apellido[indexApellido])
                indexApellido++
            }
        }
    }
    var contador = 1
    while (username.length < 6) {
        username.append(contador)
        contador++
    }    
    println("Nombre de usuario generado: $username")
}