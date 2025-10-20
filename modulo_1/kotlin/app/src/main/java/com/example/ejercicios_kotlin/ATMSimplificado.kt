fun main() {
    println("Ingrese el saldo inicial:")
    var saldo = readln().toDoubleOrNull() ?: 0.0
    
    var continuar = true
    
    whil {
        println("1) Depositar")
        println("2) Retirar")
        println("3) Salir")
        println("Seleccione una opcion:")
        
        when (readln().toIntOrNull() ?: 0) {
            1 -> {
                println("Ingrese la cantidad a depositar:")
                val deposito = readln().toDoubleOrNull() ?: 0.0
                
                if (deposito > 0) {
                    saldo += deposito
                    println("Deposito realizado con exito.")
                } else {
                    println("Error el monto debe ser mayor a cero.")
                }
                println("Saldo actual: $saldo")
            }
            
            2 -> {
                println("Ingrese la cantidad a retirar:")
                val retiro = readln().toDoubleOrNull() ?: 0.0
                
                if (retiro <= 0) {
                    println("Error el monto debe ser mayor a cero.")
                } else if (retiro > saldo) {
                    println("Error: Saldo insuficiente.")
                } else {
                    saldo -= retiro
                    println("Retiro realizado con exito.")
                }
                println("Saldo actual: $saldo")
            }
            
            3 -> {
                continuar = false
                println("Sesion terminada.")
            }
            
            else -> println("Opcion invalida intente nuevamente.")
        }
    }
}