package com.example.myapplication

fun main(){
    println("incluir primer valor")
    val value1: Int = readLine()?.toIntOrNull()?:0
    for (i in 1..10) {
        val resul = value1 * i
        println("$value1 x $i = $resul")
    }
}