void main() {
  print("Ciclos for en aplicacion de cursos online");
  
  int semanas = 10;
  int creditosPorSemana = 3;
  
  for (int semana = 1; semana <= semanas; semana++) {
    int creditosAcumulados = semana * creditosPorSemana;
    print("Semana $semana x $creditosPorSemana creditos = $creditosAcumulados creditos acumulados");
    if (creditosAcumulados >= 15 && creditosAcumulados < 24) {
      print("Has alcanzado el nivel intermedio");
    } else if (creditosAcumulados >= 24) {
      print("Has alcanzado el nivel avanzado");
    }
  }
  int creditosTotales = semanas * creditosPorSemana;
  print("Al completar el curso obtienes $creditosTotales creditos academicos");
}