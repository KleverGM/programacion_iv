void main() {
print("maps iterables");
 final numbers = [1,2,3,4,45,3,4,2,12,3];
 print("lista original $numbers");
 print("tamaño: ${numbers.length}");
 print("indice 4 ${numbers[4]}");
 print("primer elemto ${numbers.first}");
 
 final reversenumber = numbers.reversed;
 print("reverso de numbers ${reversenumber}");
 print("List: ${reversenumber.toList()}");
 print("Set: ${reversenumber.toSet()}");
}