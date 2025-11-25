package com.example.myapplication
enum class tiposable(val color: String, val poder: Int) {
    azul("azul", 85){
         override fun descripcion()="sable tradicional de los jedi"
    },
    verde("verde", 90){
        override fun descripcion()="sable de los jedi consultares"
    },
    rojo("rojo", 90){
        override fun descripcion()="sable de los sith"
    },
    morado("morado", 95){
        override fun descripcion()="sable equilibra luz y oscuridad"
    };
    abstract fun descripcion(): String
    companion object{
        fun porcolor(color: String)= values().find{it.color==color}
    }
}
class  sabledeluz(val tipo: tiposable, val portador: String){
    fun activar() ="zzzrum el sable color ${tipo.color} de ${portador} se enciende"
    fun info()= "${tipo.descripcion()} - tipo poder ${tipo.poder}"
}
fun main (){
    val sablewindoo = sabledeluz(tiposable.morado, "windoo")
    println(sablewindoo)
    println(sablewindoo.activar())
    println(sablewindoo.info())

    val sableluke = sabledeluz(tiposable.verde, "luke skywalker")
    println(sableluke)
    println(sableluke.activar())
    println(sableluke.info())
}