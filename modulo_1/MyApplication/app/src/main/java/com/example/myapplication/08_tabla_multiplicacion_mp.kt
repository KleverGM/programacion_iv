package com.example.myapplication

fun main(){
    println("Tabla de costo total cursos online")
    println("Ingresa el precio por curso:")
    val precioPorCurso: Int = readLine()?.toIntOrNull() ?: 0

    for (i in 1..10) {
        val total = precioPorCurso * i
        println("$precioPorCurso x $i curso(s) = $total USD")
    }
}