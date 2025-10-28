package com.example.myapplication

fun main(){
    println("listas")
    val inmutable: List<Int> = listOf(1,2,3)
    println("lista inmutable: ${inmutable}")

    val mutable: MutableList<Int> = mutableListOf(4,5,6)
    println("lista mutable ${mutable}")

    mutable.add(7)
    println("lista mutable añadida ${mutable}")
    mutable.removeAt(0)
    println("lista removida ${mutable}")

    //recorrido
    for (mutablee in mutable) println(mutablee)

    println("operaciones")
    val colores = mutableListOf("rojo", "verde",)
    colores.add("azul")
    colores+="amarillo"
    colores.add(index = 1, element = "blanco")
    println(colores)
    colores.remove("verde")
    println("color elmemindao ${colores} ")
    colores.removeAt(0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    //busquedas
    println("busquedas con list mutables ")
    val personas = mutableListOf("juan", "luis", "pedro")
    println(personas.find {it.startsWith("l")})
    println(personas.firstOrNull {it.length>4})
    println(personas.any {it.contains('j')})
    println(personas.none {it =="x"})

    //ordenamiento
    println("ordenamiento con list mutable")
    val numerodesor = mutableListOf(8,3,2,7,2,7,0,6)
    println(numerodesor.sorted())
    println(numerodesor.sortedDescending())
    println(numerodesor.distinct())


}