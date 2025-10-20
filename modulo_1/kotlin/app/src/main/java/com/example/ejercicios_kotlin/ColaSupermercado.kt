fun main() {
    var ventaTotal = 0.0
    var cantidadClientes = 0
    var continuar = true
    
    while{
        println("Nuevo cliente (ingrese 'fin' para terminar):")
        val entrada = readln()
        
        if (entrada.lowercase() == "fin") {
            continuar = false
            continue
        }
        
        println("Ingrese el total de la compra:")
        val total = readln().toDoubleOrNull() ?: 0.0
        
        println("Ingrese la cantidad de items:")
        val items = readln().toIntOrNull() ?: 0
        
        var totalFinal = total
        if (total > 100) {
            val descuento = total * 0.05
            totalFinal = total - descuento
            println("Descuento aplicado (5%): $descuento")
            println("Total con descuento: $totalFinal")
        } else {
            println("Total: $totalFinal")
        }
        
        if (items > 10) {
            println("Caja rapida no disponible")
        }
        
        ventaTotal += totalFinal
        cantidadClientes++
    }
    println("Total de ventas: $ventaTotal")
    println("Cantidad de clientes: $cantidadClientes")
}