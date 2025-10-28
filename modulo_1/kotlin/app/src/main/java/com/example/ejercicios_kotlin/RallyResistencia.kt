fun main() {    
    var energia = 100
    println("Ingrese el numero de etapas del rally:")
    val numEtapas = readln().toIntOrNull() ?: 0
    
    if (numEtapas <= 0) {
        println("El numero de etapas debe ser mayor a cero")
        return
    }
    
    println("Comenzando rally con $energia de energia")
    
    for (etapa in 1..numEtapas) {
        val terreno = (1..3).random()
        val perdidaEnergia = when (terreno) {
            1 -> {
                println("Etapa $etapa: Terreno de asfalto (-5 energia)")
                5
            }
            2 -> {
                println("Etapa $etapa: Terreno de tierra (-10 energia)")
                10
            }
            else -> {
                println("Etapa $etapa: Terreno de barro (-15 energia)")
                15
            }
        }
        energia -= perdidaEnergia
        println("Energia restante: $energia")        
        if (energia <= 0) {
            println("Abandona en etapa $etapa")
            return
        }
    }    
    println("Rally completado con energia $energia")
}