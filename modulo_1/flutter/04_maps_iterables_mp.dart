void main() {
print("Maps iterables en aplicacion de cursos online");
 final duracionModulos = [30,45,25,60,40,35,45,20,50,30];
 print("Duracion de modulos del curso: $duracionModulos");
 print("Cantidad de modulos: ${duracionModulos.length}");
 print("Duracion del modulo 5: ${duracionModulos[4]}");
 print("Duracion del primer modulo: ${duracionModulos.first}");

 final modulosInversos = duracionModulos.reversed;
 print("Modulos en orden inverso: ${modulosInversos}");
 print("Lista: ${modulosInversos.toList()}");
 print("Set: ${modulosInversos.toSet()}");
}