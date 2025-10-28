package com.example.myapplication

fun mostrarBienvenida(){
    println("¡Bienvenido a nuestra plataforma de cursos online!")
}

fun iniciarSesion(){
    mostrarBienvenida()
}

//funcion con parametros de retorno
fun calcularPromedioCalificaciones(calificacion1: Int, calificacion2: Int): Int{
    return (calificacion1 + calificacion2) / 2
}

//funcion con expresion
fun calcularTotalCreditos(numeroCursos: Int) = numeroCursos * 3

// funcion con retorno multiple
fun calcularEstadisticasCurso(aciertos: Int, errores: Int): Pair<Int, Double>{
    val total = aciertos + errores
    val porcentajeExito = (aciertos.toDouble() / total) * 100
    return Pair(total, porcentajeExito)
}
fun main(){
    mostrarBienvenida()
    val promedioNotas = calcularPromedioCalificaciones(85, 95)
    println("Promedio de calificaciones: $promedioNotas")
    println("Total de créditos: ${calcularTotalCreditos(5)}")
    val (totalPreguntas, porcentajeAciertos) = calcularEstadisticasCurso(15, 5)
    println("Total de preguntas: $totalPreguntas, Porcentaje de aciertos: $porcentajeAciertos%")

//funcion lambda
    val calcularNotaFinal = {parcial: Int, examenFinal: Int -> (parcial * 0.4 + examenFinal * 0.6).toInt()}
    val mensajeProgreso = {estudiante: String -> "El progreso de $estudiante está siendo analizado"}
    println("Nota final calculada: ${calcularNotaFinal(80, 90)}")
    println(mensajeProgreso("Carlos"))
}