package com.example.myapplication

fun main(){
    try {
        val resltado= 8/0;
    }catch (e: Exception){
        println(e)
        println("error de division")
    }
}