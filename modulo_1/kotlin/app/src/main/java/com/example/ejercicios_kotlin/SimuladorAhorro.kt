fun main() {    
    println("Ingrese su meta de ahorro:")
    val meta = readln().toDoubleOrNull() ?: 0.0
    
    println("Ingrese su ahorro inicial:")
    val ahorroInicial = readln().toDoubleOrNull() ?: 0.0
    var ahorroTotal = ahorroInicial
    var depositoSemanal = 5.0 
    var semana = 1
    
    println("Comenzando simulacion de ahorro")
    println("Ahorro inicial: $ahorroInicial")
    
    while (ahorroTotal < meta) {
        ahorroTotal += depositoSemanal
        println("Semana $semana: Deposito de $depositoSemanal, Ahorro total: $ahorroTotal")
        
        depositoSemanal += 10 
        semana++
    }
    
    println("Has alcanzado tu meta de $meta en ${semana - 1} semanas.")
}
