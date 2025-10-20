package com.example.basics

fun main() {
    println("variables (cursos online)")
    val curso = "Kotlin desde cero"
    var instructor = "Ana"
    instructor = "Carlos"

    println("tipos de variables")
    println("tipos numericos")
    println("tipo entero")
    val duracionHoras: Int = 40
    println(duracionHoras)
    println("tipo double")
    val precio: Double = 49.99
    println(precio)
    println("tipo float")
    val calificacionPromedio: Float = 4.7f
    println(calificacionPromedio)
    println("tipo long")
    val inscritos: Long = 1_250_000L
    println(inscritos)

    println("tipo texto")
    val titulo: String = "Curso profesional de Kotlin"
    println(titulo)

    println("tipo char")
    val nivel: Char = 'B' // B: Basico, I: Intermedio, A: Avanzado
    println(nivel)

    println("tipo logico")
    val esGratis: Boolean = false
    println(esGratis)

    println("nulidad")
    val cuponDescuento: String? = "Bienvenidos"
    println(cuponDescuento)

    println("nulidad")
    val comentarioOpcional: String? = ""
    println(comentarioOpcional?.length)

    //Excepcion si cupon descuento es null
    println("operacion de asercion no null")
    val longitudCupon = cuponDescuento!!.length
    println(longitudCupon)

    println("interpolacion de string")
    val nombreEstudiante: String = "Lucia"
    val edadEstudiante: Int = 22
    val plataforma: String = "Mobile Academy"

    println("${nombreEstudiante.uppercase()} se inscribio en $curso de $plataforma")
    println("En 5 anios tendra: ${edadEstudiante + 5} anios")
    println("Precio con IVA (12%): ${precio * 1.12}")

    println("string multilinea")
    val mensaje = """
        Hola $nombreEstudiante,
        Gracias por inscribirte en "$curso".
        Instructor: $instructor
        Duracion: $duracionHoras horas
        ¡Exitos y que disfrutes el aprendizaje!
        """
    println(mensaje)

    println("conversiones")
    val textoHoras: String = "40"
    val horasConvertidas: Int = textoHoras.toInt()
    println(horasConvertidas)

    val calificacionNumerica: Double = 4.85
    val calificacionTexto: String = calificacionNumerica.toString()
    println(calificacionTexto)
}