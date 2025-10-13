package com.example.myapplication

fun main(){
    println("operadores_aritmeticos (cursos online)")
    val precioBase: Double = 49.99
    val costoMaterial: Double = 3.0

    println("Suma : $precioBase + $costoMaterial = ${precioBase + costoMaterial}")
    println("Resta : $precioBase - $costoMaterial = ${precioBase - costoMaterial}")
    println("Multiplicacion : $precioBase * $costoMaterial = ${precioBase * costoMaterial}")
    println("Division : $precioBase / $costoMaterial = ${precioBase / costoMaterial}")

    //Descuento e impuestos
    val descuento = 0.20              
    val iva = 0.12                   
    val precioConDescuento = precioBase * (1 - descuento)
    val precioFinal = precioConDescuento * (1 + iva)
    println("Precio con 20% de descuento: $precioConDescuento")
    println("Precio final con IVA 12%: $precioFinal")
}