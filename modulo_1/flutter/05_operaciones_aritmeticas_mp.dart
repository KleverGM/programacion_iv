void main() {
print("Operaciones aritmeticas para aplicacion de cursos online");
 final double precioCurso = 12.5;
 final double descuento = 5;
 
  print("Precio con descuento $precioCurso + $descuento = ${precioCurso + descuento}");
  print("Precio con descuento $precioCurso - $descuento = ${precioCurso - descuento}");
  print("Precio por cantidad $precioCurso * $descuento = ${precioCurso * descuento}");
  print("Precio dividido $precioCurso / $descuento = ${precioCurso / descuento}");

  int modulosCompletados = 2;
  int modulosTotales = 3;
  print("Incremento de modulos completados $modulosCompletados++ = ${modulosCompletados++}");
  print("Decremento de modulos totales $modulosTotales-- = ${modulosTotales--}");
  print("Incremento de modulos completados ++$modulosCompletados = ${++modulosCompletados}");
  print("Decremento de modulos totales --$modulosTotales = ${--modulosTotales}");

  print("El valor de modulos completados es $modulosCompletados");
  print("El valor de modulos totales es $modulosTotales");
}