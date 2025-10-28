package com.example.myapplication

fun main(){
    try {
        // división entre cero
        val totalCalificaciones = 850
        val numeroEstudiantes = 0
        val promedio = totalCalificaciones / numeroEstudiantes
        println("El promedio del curso es: $promedio")
    } catch (e: ArithmeticException){
        println(e)
        println("Error: No se puede calcular el promedio porque no hay estudiantes registrados en el curso")
    } catch (e: Exception){
        println(e)
        println("Error inesperado al calcular el promedio")
    } finally {
        println("Operación de cálculo de promedio finalizada")
    }
}