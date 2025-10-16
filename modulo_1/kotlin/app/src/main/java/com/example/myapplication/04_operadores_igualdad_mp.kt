package com.example.myapplication

fun main(){
    println("operadores_igualdad (cursos online)")

    //Curso
    val curso1: String = "Kotlin desde cero"
    val curso2: String = "Kotlin desde cero"
    val curso3: String = String("Kotlin desde cero".toCharArray())
    println("Igualdad estructural (contenido) con String")
    println(curso1 == curso2)  
    println(curso1 == curso3)

    println("Igualdad referencial (misma instancia) con String")
    println(curso1 === curso2)
    println(curso1 === curso3)

}