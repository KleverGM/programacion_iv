package com.example.myapplication

fun main(){
    println("calculadora")
    println("incluir primer valor")
    val val1: Int = readLine()?.toIntOrNull()?:0
    println("Incluir segundo valor")
    val val2: Int = readLine()?.toIntOrNull()?:0

    println("Suma : ${val1} + ${val2}")
    println("resta : ${val1} - ${val2}")
    println("Multiplicacion : ${val1} * ${val2}")
    println("division : ${val1} / ${val2}")

    println("!calculadora!!!")
    println("!Incluir el primer valor!!!")
    val value1: Int = readLine()?.toIntOrNull() ?: 0
    println("!Incluir el segundo valor!!!")
    val value2: Int = readLine()?.toIntOrNull() ?: 0
    println("1 suma, 2 resta, 3 multiplicacion, 4 division")
    val operacion: Int = readLine()?.toIntOrNull() ?: 0

    when (operacion) {
        1 -> println("suma : ${value1 + value2}")
        2 -> println("resta : ${value1 - value2}")
        3 -> println("multiplicacion : ${value1 * value2}")
        4 -> println("division : ${value1 / value2}")
        else -> println("opcion no válida")
    }
}