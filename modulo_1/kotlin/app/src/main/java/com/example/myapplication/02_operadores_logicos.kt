package com.example.myapplication

fun main(){
    println("operadores")
    val edad: Int = 25
    val entrenamiento: Boolean = true
    val nivel: Int = 8
    val esapto = edad>= 18 && entrenamiento && nivel > 5
    val necesitayuda = !entrenamiento || nivel < 3
    println(" es apto : ${esapto}")
    println("necesita Ayuda : ${necesitayuda}")
}