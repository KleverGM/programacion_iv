package com.example.myapplication

fun main(){
    println("Estructura de control")
    println("condicionales")

    //Curso tiene más inscritos
    val inscritosCursoA = 120
    val inscritosCursoB = 150
    if (inscritosCursoA > inscritosCursoB){
        println("El curso A tiene más inscritos: $inscritosCursoA")
    } else {
        println("El curso B tiene más inscritos: $inscritosCursoB")
    }

    //Rango según puntaje diagnóstico del estudiante
    println("Rango segun puntaje diagnostico")
    var puntaje: Int = 70
    if (puntaje >= 85){
        println("Nivel: Avanzado")
    } else if (puntaje >= 60){
        println("Nivel: Intermedio")
    } else {
        println("Nivel: Principiante")
    }

    //Clasificación por tipo de curso
    var tipoCurso: String = "Kotlin"
    when(tipoCurso){
        "Kotlin", "Android" -> println("Area: Programacion movil")
        "UI/UX", "Diseno" -> println("Area: Diseno de interfaces")
        "Data Science", "ML" -> println("Area: Ciencia de Datos")
        else -> println("Area: Por asignar")
    }

    var cargaSemanalHoras: Int = 12
    var presupuestoUSD: Int = 60
    when {
        cargaSemanalHoras < 5 && presupuestoUSD < 20 ->
            println("Recomendacion: Microcursos gratuitos")
        cargaSemanalHoras >= 10 && presupuestoUSD >= 50 ->
            println("Recomendacion: Curso completo con certificacion")
        else ->
            println("Recomendacion: Revisar combos o becas")
    }
}