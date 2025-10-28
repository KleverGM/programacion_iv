fun main() {
    println("Ingresa un texto:")
    val texto = readln().lowercase()
    
    val vocales = setOf('a', 'e', 'i', 'o', 'u')
    var contadorVocalesConsecutivas = 0
    
    for (i in 0 until texto.length - 1) {
        if (texto[i] in vocales && texto[i + 1] in vocales) {
            contadorVocalesConsecutivas++
            println("Vocales consecutivas encontradas: ${texto[i]}${texto[i+1]}")
        }
    }
    println("Total de vocales consecutivas encontradas: $contadorVocalesConsecutivas")
}