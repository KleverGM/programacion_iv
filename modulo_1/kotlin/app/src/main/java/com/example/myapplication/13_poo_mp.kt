package com.example.myapplication
data class Estudiante(
    val nombre: String,
    val edad: Int,
    val promedio: Int,
    val tutor: String?=null,
) {
    val nivel: String
        get() = when {
            promedio >= 90 -> "excelente"
            promedio >= 70 -> "bueno"
            promedio >= 50 -> "regular"
            else -> {
                "necesita mejorar"
            }
        }
    fun puedeSerTutor(): Boolean = promedio >= 70
    fun requiereTutoria(): Boolean = promedio <= 60
}
fun main(){
    val carlos = Estudiante(
        nombre = "Carlos Rodríguez",
        edad = 25,
        promedio = 75,
        tutor = "María Gómez"
    )
    println(carlos)

    //desestructuración
    val(nombre, edad, promedio) = carlos
    println("Nombre del estudiante: ${nombre}, edad: ${edad}, promedio académico: ${promedio}")

    //copiar objetos
    val ana = carlos.copy(nombre = "Ana Martínez", promedio=85)
    println(ana)

    //propiedades calculadas
    println("Nivel académico de Ana: ${ana.nivel}")
    println("¿Ana puede ser tutora?: ${ana.puedeSerTutor()}")
}