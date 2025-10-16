package com.example.myapplication

fun main(){
    println("El usuario ingresa su promedio y si trabaja")
    val val1: Int = readLine()?.toIntOrNull()?:0
    val val2: String = readLine()?.lowercase()?:"no"
    val val3: Boolean = (val2 == "si")
}