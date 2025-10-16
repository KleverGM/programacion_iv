package com.example.myapplication

fun main(){
    println("mapas")
    println("mapa inmutable")
    val calificacionesCursos = mapOf(
        "programación" to 85,
        "diseño" to 80,
        "bases de datos" to 95,
        "inteligencia artificial" to 100
    )
    println("calificaciones de los cursos: ${calificacionesCursos}")

    println("mapa mutable")
    val cursosCompletados = mutableMapOf<String, Int>()
    cursosCompletados["programación"] = 15
    cursosCompletados["diseño"] = 12
    cursosCompletados.put("marketing", 20)
    println("módulos completados: ${cursosCompletados}")

    //iteracion
    for((curso, calificacion) in calificacionesCursos){
        println("$curso tiene una calificación de $calificacion")
    }

    //otra manera
    val cursosDisponibles = setOf("python", "kotlin", "javascript")
    println("cursos disponibles: ${cursosDisponibles}")

    val cursosRecomendados = setOf("android", "kotlin", "flutter")
    println("cursos recomendados: ${cursosRecomendados}")

    println("Operaciones de conjuntos")
    val interseccion = cursosRecomendados intersect cursosDisponibles
    val union = cursosRecomendados union cursosDisponibles
    val diferencia = cursosRecomendados - cursosDisponibles
    println("cursos recomendados y disponibles: ${interseccion}")
    println("cursos recomendados pero no disponibles: ${diferencia}")
    println("todos los cursos: ${union}")

    //ejemplo
    println("Introduce la hora actual (en formato de 0 a 23):")
    val hora: Int = readLine()?.toIntOrNull() ?: -1
    if (hora in 7..13) {
        println("Resultado: Los cursos en vivo de la mañana están disponibles.")
    } else if (hora in 14..19) {
        println("Resultado: Los cursos en vivo de la tarde están disponibles.")
    } else {
        println("Resultado: No hay cursos en vivo disponibles en este momento.")
    }

}