package com.example.myapplication
enum class TipoCurso(val categoria: String, val nivelDificultad: Int) {
    DESARROLLO("desarrollo", 85){
         override fun descripcion()="curso enfocado en programación y desarrollo de software"
    },
    DISENO("diseño", 90){
        override fun descripcion()="curso de diseño gráfico y experiencia de usuario"
    },
    MARKETING("marketing", 70){
        override fun descripcion()="curso sobre estrategias de marketing digital"
    },
    DATASCIENCE("data science", 95){
        override fun descripcion()="curso avanzado de análisis de datos y machine learning"
    };
    abstract fun descripcion(): String
    companion object{
        fun porCategoria(categoria: String)= values().find{it.categoria==categoria}
    }
}
class  Curso(val tipo: TipoCurso, val instructor: String){
    fun iniciar() ="El curso de ${tipo.categoria} impartido por ${instructor} ha comenzado"
    fun info()= "${tipo.descripcion()} - Nivel de dificultad: ${tipo.nivelDificultad}"
}
fun main (){
    val cursoPython = Curso(TipoCurso.DESARROLLO, "Ana García")
    println(cursoPython)
    println(cursoPython.iniciar())
    println(cursoPython.info())

    val cursoUX = Curso(TipoCurso.DISENO, "Carlos Rodríguez")
    println(cursoUX)
    println(cursoUX.iniciar())
    println(cursoUX.info())
}