package com.example.myapplication

fun main(){
    println("Estrucutra de control")
    println("condicionales")
    val value1 = 10
    val value2 = 15
    if (value1>value2){
        println("El mayor es ${value1}")
    } else {
        println("el mayor es ${value2}")
    }
    println("Rango segun nivel de la fuerza")
    var fuerza: Int = 10
    if (fuerza > 10){
        println("Maestro")
    } else if (fuerza > 5){
        println("caballero jedi")
    } else {
        println("Padawan")
    }


    var tipodroide: String = "BB-8"
    when(tipodroide){
        "R2-D2", "R2-Q5"->print("Droide astromecanico")
        "C-3PO", "C-#PA"->print("Droide de protocolo")
        "BBB-8", "BB-9E"->print("Droide de nueva generecion")
        else->print("Modelos desconocido")
    }

    var peligro: Int = 10
    var recompensa: Int = 50
    when{
        peligro>8 && recompensa < 1000->print("Mision rechazada")
        peligro <=3 ->print("Mision aceptada")
        else->print("Requiere evaluacion adicional")
    }



}

