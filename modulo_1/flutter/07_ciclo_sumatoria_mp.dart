void main() {
  print("Ciclos en aplicacion de cursos online");
  
  int nivelMaximo = 6;
  double puntosAcumulados = 0;
  
  for (int nivel = 1; nivel <= nivelMaximo; nivel++) {
    puntosAcumulados += nivel;
    print("Completaste nivel $nivel - ganaste $nivel puntos - puntos acumulados: $puntosAcumulados");
  }

  print("Has completado todos los $nivelMaximo niveles con un total de $puntosAcumulados puntos");

  if (puntosAcumulados > 15) {
    print("Desbloqueaste la insignia de estudiante avanzado");
  }
}
