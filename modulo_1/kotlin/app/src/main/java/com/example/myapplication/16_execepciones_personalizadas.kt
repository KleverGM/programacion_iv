package com.example.myapplication

import android.os.Message


class fuerzainsuficienteException(message: String) : Exception(message)
class missionpeligrosaException(message: String) : Exception(message)

fun realizarmision(nivelfuerza: Int, peligromision: Int): String{
    return try {
        when {
            nivelfuerza<30 -> throw fuerzainsuficienteException("nivel de fuerza muy bajo: ${nivelfuerza}")
            nivelfuerza>80 -> throw missionpeligrosaException("mision extremadamente peligrosa")
            else -> {"error inesperado"}
        }
    } catch (e: fuerzainsuficienteException){
        "error: ${e.message} se requiere entrenamiento adicional"
    } catch (e: missionpeligrosaException){
        "error: ${e.message} nivel de peligro ${peligromision} "
    } catch (e: Exception){
        "${e.message}"
    } finally {
        "reporte enviado"
    }
}

fun main(){
    println(realizarmision(20, 60))
    println(realizarmision(100, 60))
}