package com.example.myapplication

fun main(){
    println("listas")
    val calificacionesFinales: List<Int> = listOf(85,90,78)
    println("calificaciones finales (inmutable): ${calificacionesFinales}")

    val creditosPorCurso: MutableList<Int> = mutableListOf(3,4,5)
    println("créditos por curso (mutable): ${creditosPorCurso}")

    creditosPorCurso.add(2)
    println("nuevo curso añadido con créditos: ${creditosPorCurso}")
    creditosPorCurso.removeAt(0)
    println("primer curso eliminado: ${creditosPorCurso}")

    //recorrido
    println("créditos de cada curso:")
    for (credito in creditosPorCurso) println(credito)

    println("operaciones con categorías de cursos")
    val categorias = mutableListOf("desarrollo", "diseño",)
    categorias.add("marketing")
    categorias+="data science"
    categorias.add(index = 1, element = "ux/ui")
    println(categorias)
    categorias.remove("diseño")
    println("categoría eliminada: ${categorias} ")
    categorias.removeAt(0)
    println(categorias)
    categorias[0]="inteligencia artificial"
    println(categorias)
    categorias.clear()
    println("¿La lista de categorías está vacía? ${categorias.isEmpty()}")

    //busquedas
    println("búsquedas en lista de instructores ")
    val instructores = mutableListOf("carlos", "laura", "pablo")
    println("instructor que empieza con 'l': ${instructores.find {it.startsWith("l")}}")
    println("instructor con nombre de más de 5 letras: ${instructores.firstOrNull {it.length>5}}")
    println("¿hay algún instructor con la letra 'c'?: ${instructores.any {it.contains('c')}}")
    println("¿no hay instructores llamados 'miguel'?: ${instructores.none {it =="miguel"}}")

    //ordenamiento
    println("ordenamiento de calificaciones")
    val calificacionesCursos = mutableListOf(85,67,92,78,67,92,100,88)
    println("calificaciones ordenadas: ${calificacionesCursos.sorted()}")
    println("calificaciones ordenadas descendente: ${calificacionesCursos.sortedDescending()}")
    println("calificaciones únicas: ${calificacionesCursos.distinct()}")


}