void main() {
  print("Ciclos while en aplicacion de cursos online");
  
  int totalLecciones = 10;
  int puntosPorLeccion = 3;
  int leccionActual = 0;

  print("Progreso usando ciclo while:");
  while (leccionActual <= totalLecciones) {
    print("Leccion $leccionActual completada - puntos ganados: ${leccionActual * puntosPorLeccion}");
    leccionActual++;
  }

  print("Progreso usando ciclo do while:");
  leccionActual = 1;
  do {
    int puntos = leccionActual * puntosPorLeccion;
    print("Completaste la leccion $leccionActual - puntos acumulados: $puntos");
    if (puntos % 9 == 0 && puntos > 0) {
      print("¡Has desbloqueado material adicional!");
    }
    leccionActual++;
  } while (leccionActual < totalLecciones);
  print("Has completado $leccionActual de $totalLecciones lecciones");
}
