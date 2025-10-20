package com.example.myapplication
fun suma(num1: Int, num2: Int): Int {
    return num1 + num2
}

fun restar(num1: Int, num2: Int): Int {
    return num1 - num2
}

fun multiplicar(num1: Int, num2: Int): Int {
    return num1 * num2
}


fun dividir(num1: Int, num2: Int): String {
    if (num2 != 0) {
        val val1 = num1 / num2
        val resto = num1 % num2
        return "El resultado de la división es: $val1 (con resto: $resto)"
    } else {
        return "Error: No se puede dividir por cero."
    }
}


fun main() {
    println("Ingresa el primer número:")
    val numero1: Int = readLine()?.toIntOrNull() ?: 0

    println("Ingresa el segundo número:")
    val numero2: Int = readLine()?.toIntOrNull() ?: 0

    println("Ingresa el signo de la operación (+, -, *, /):")
    val signo: String = readLine()?.trim() ?: ""

    when (signo) {
        "+" -> {
            val resultado = suma(numero1, numero2)
            println("El resultado de $numero1 + $numero2 es: $resultado")
        }
        "-" -> {
            val resultado = restar(numero1, numero2)
            println("El resultado de $numero1 - $numero2 es: $resultado")
        }
        "*" -> {
            val resultado = multiplicar(numero1, numero2)
            println("El resultado de $numero1 * $numero2 es: $resultado")
        }
        "/" -> {
            val resultadoTexto = dividir(numero1, numero2)
            println(resultadoTexto)
        }
        else -> {
            println("Error: El signo de operación '$signo' no es válido.")
        }
    }
}
