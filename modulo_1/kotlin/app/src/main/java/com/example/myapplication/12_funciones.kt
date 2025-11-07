package com.example.myapplication

fun saludar(){
    println("ola desde una funcion de Kotlin")
}

fun sa(){
    saludar()
}

//funcion con parametros de retorno
fun sumar(a: Int, b: Int): Int{
    return a + b
}

//funcion con expresion
fun cuadrado(numero: Int) = numero * numero

// funcion con retorno multiple
fun retornomulti(a: Int, b: Int): Pair<Int, Int>{
    val suma = a+b
    val resta = a-b
    return Pair(suma, resta)
}
fun main(){
    saludar()
    val resultado = sumar(5,6)
    println(resultado)
    println(cuadrado(5))
    println(retornomulti(15,5))

//funcion lambda
    val cuadradolam = {x: Int-> x*x}
    val saludolamb = {nombre: String-> "Hola, $nombre"}
    println(cuadradolam(4))
    println(saludolamb("Klever"))
}