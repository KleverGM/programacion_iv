package com.example.myapplication

fun main(){
    println("bucles cursos online")

    //Lista de cursos
    val cursos = listOf(
        "Kotlin desde cero",
        "Android Básico",
        "Kotlin Intermedio",
        "Kotlin Avanzado",
        "Jetpack Compose"
    )

    //Recorrido con índice
    for ((index, curso) in cursos.withIndex()){
        println("${index + 1}. $curso")
    }

    //Rangos de paso: progreso de un estudiante
    for (i in 0 .. 100 step 25){
        println("Progreso: $i%")
    }

    //Rangos descendentes: cuenta regresiva para clase en vivo
    for (countdown in 5 downTo 1){
        println("La clase en vivo inicia en: $countdown min")
    }

    //Control de flujo: saltar un curso y cortar en otro
    for (curso in cursos){
        if (curso.contains("Intermedio")) continue 
        if (curso.contains("Avanzado")) break      
        println("Abriendo curso: $curso")
    }

}