package com.example.myapplication

class CalificacionInsuficienteException(message: String) : Exception(message)
class CursoAvanzadoException(message: String) : Exception(message)
class RequisitosIncompletosException(message: String) : Exception(message)

fun inscribirCurso(calificacionPrevia: Int, nivelDificultad: Int, requisitosCompletados: Boolean): String {
    return try {
        when {
            calificacionPrevia < 60 -> throw CalificacionInsuficienteException("Calificación previa insuficiente: ${calificacionPrevia}")
            nivelDificultad > 80 && !requisitosCompletados -> throw RequisitosIncompletosException("Faltan requisitos previos para este curso")
            nivelDificultad > 85 -> throw CursoAvanzadoException("El curso es de nivel avanzado")
            else -> {"Inscripción realizada con éxito"}
        }
    } catch (e: CalificacionInsuficienteException) {
        "Error: ${e.message}. Se recomienda tomar un curso preparatorio"
    } catch (e: RequisitosIncompletosException) {
        "Error: ${e.message}. Nivel de dificultad: ${ncivelDificultad}"
    } catch (e: CursoAvanzadoException) {
        "Advertencia: ${e.message}. Puedes continuar pero será desafiante"
    } catch (e: Exception) {
        "Error inesperado: ${e.message}"
    } finally {
        "Proceso de inscripción finalizado"
    }
}

fun main() {
    println(inscribirCurso(50, 70, true))
    println(inscribirCurso(90, 90, false))
    println(inscribirCurso(75, 90, true))
    println(inscribirCurso(65, 75, true))
}