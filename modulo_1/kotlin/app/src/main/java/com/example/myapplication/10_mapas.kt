package com.example.myapplication

fun main(){
    println("mapas")
    println("mapa inmutable")
    val fuerzajedi = mapOf(
        "luke" to 85,
        "leia" to 80,
        "obi wan" to 95,
        "yoda" to 100
    )
    println("fuerza de los jedis: ${fuerzajedi}")

    println("mapa mutable")
    val misioncomplete = mutableMapOf<String, Int>()
    misioncomplete ["luke"] = 15
    misioncomplete ["leia"] = 12
    misioncomplete.put("han", 20)
    println("missions: ${misioncomplete}")

    //iteracion
    for((jedi, fuerza) in fuerzajedi){
        println("$jedi tiene nivel de fuerza $fuerza")
    }

    //otra manera
    val planetasvis = setOf("tatooine", "couscant", "dagobah")
    println("planetas visitados: ${planetasvis}")

    val planetaspel = setOf("mustafar", "couscant", "korriban")
    println("planetas visitados: ${planetaspel}")

    println("Opereaciones de conjuntos")
    val interseccion = planetaspel intersect  planetasvis
    val uniion = planetaspel union planetasvis
    val diferencia = planetaspel - planetasvis
    println("plenetas visitados y peligrosos. ${interseccion}")
    println("planetas seguros visitados: ${diferencia}")
    println("todos los planetas: ${uniion}")

    //ejmplo
    println("Introduce la hora actual (en formato de 0 a 23):")
    val hora: Int = readLine()?.toIntOrNull() ?: -1
    if (hora in 7..13) {
        println("Resultado: Estás en horario de clases de la mañana.")
    } else if (hora in 14..19) {
        println("Resultado: Estás en horario de clases de la tarde.")
    } else {
        println("Resultado: Estás fuera del horario lectivo.")
    }

}