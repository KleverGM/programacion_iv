package com.example.myapplication

fun main() {
    println("operadores (cursos online)")

    //Elegibilidad para curso avanzado
    val edad: Int = 19
    val tienePrerequisito: Boolean = true
    val nivelDiagnostico: Int = 7
    val esAptoCursoAvanzado = edad >= 18 && tienePrerequisito && nivelDiagnostico >= 6
    val necesitaPropedeutico = !tienePrerequisito || nivelDiagnostico < 6
    println("Es apto para curso avanzado: $esAptoCursoAvanzado")
    println("Necesita curso propedeutico: $necesitaPropedeutico")

    //Aplicación de descuento
    val esNuevoUsuario: Boolean = true
    val cuponValido: Boolean = false
    val esBlackFriday: Boolean = true
    val aplicaDescuento = esNuevoUsuario || cuponValido || esBlackFriday
    println("Aplica descuento: $aplicaDescuento")
}