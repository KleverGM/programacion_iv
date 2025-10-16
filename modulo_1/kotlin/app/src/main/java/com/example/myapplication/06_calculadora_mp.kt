package com.example.myapplication

fun main(){
    println("calculadora cursos online")
    println("Ingresa precio base del curso:")
    val val1: Int = readLine()?.toIntOrNull() ?: 0
    println("Ingresa costo de materiales:")
    val val2: Int = readLine()?.toIntOrNull() ?: 0

    println("Suma: $val1 + $val2 = ${val1 + val2}")
    println("Resta: $val1 - $val2 = ${val1 - val2}")
    println("Multiplicación: $val1 * $val2 = ${val1 * val2}")
    if (val2 != 0) {
        println("División: $val1 / $val2 = ${val1 / val2}")
    } else {
        println("División: no se puede dividir entre 0")
    }

    //Mini-menú temático
    println("¡Calculadora temática!")
    println("Ingresa el numero de ingresados:")
    val value1: Int = readLine()?.toIntOrNull() ?: 0
    println("Ingresa el numero de grupo):")
    val value2: Int = readLine()?.toIntOrNull() ?: 0
    println("Elige la operación: 1 suma, 2 resta, 3 multiplicación, 4 división")

    val operacion: Int = readLine()?.toIntOrNull() ?: 0
    when (operacion) {
        1 -> println("Suma: ${value1 + value2}")
        2 -> println("Resta: ${value1 - value2}")
        3 -> println("Multiplicación: ${value1 * value2}")
        4 -> {
            if (value2 != 0) {
                val cociente = value1 / value2
                val resto = value1 % value2
                println("División: $cociente, resto: $resto")
            } else {
                println("División: no se puede dividir entre 0")
            }
        }
        else -> println("Opción no válida")
    }
}