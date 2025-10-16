package com.example.myapplication
data class jedi(
    val nombre: String,
    val edad: Int,
    val nivelfuerza: Int,
    val maestro: String?=null,
) {
    val rango: String
        get() = when {
            nivelfuerza >= 90 -> "maestro"
            nivelfuerza >= 70 -> "caballero"
            nivelfuerza >= 50 -> "padawan"
            else -> {
                "iniciando"
            }
        }
    fun puedeenseniar(): Boolean = nivelfuerza >= 70
    fun entrenar(): Boolean = edad <= 5
}
fun main(){
    val luke = jedi(
        nombre = "anakin skywalker",
        edad = 25,
        nivelfuerza = 75,
        maestro = "obiwan kenobi"
    )
    println(luke)

    //descentrilizacion
    val(nombre, edad, nivelfuerza) = luke
    println("nombre del jedi ${nombre}, edad: ${edad}, nivel de la fuerza: ${nivelfuerza}")

    //copiar objetos
    val ashoka = luke.copy(nombre = "ashoka", nivelfuerza=80)
    println(ashoka)

    //propiedades calculada
    println("rango de ashoka ${ashoka.rango}")
    println("ashoka puede enseniar ${ashoka.puedeenseniar()}")
}