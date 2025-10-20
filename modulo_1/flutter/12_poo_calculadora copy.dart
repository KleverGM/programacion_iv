void main() {
  print("Calculadora de progreso en aplicacion de cursos online");
  
  final CalculadoraCurso estadisticas = CalculadoraCurso(
    horasCompletadas: 5.2,
    horasTotales: 8
  );
  
  print("Horas restantes: ${estadisticas.horasRestantes()}");
  print("Porcentaje completado: ${estadisticas.porcentajeCompletado()}%");
  print("Horas diarias necesarias (7 dias): ${estadisticas.horasDiariasNecesarias(7)}");
  print("Eficiencia de estudio: ${estadisticas.eficienciaEstudio()}");

}

class CalculadoraCurso {
  double horasCompletadas = 0.0;
  double horasTotales = 0.0;
  
  CalculadoraCurso({required this.horasCompletadas, required this.horasTotales});
  
  double horasRestantes() {
    return this.horasTotales - this.horasCompletadas;
  }
  
  double porcentajeCompletado() {
    return (this.horasCompletadas / this.horasTotales) * 100;
  }
  
  double horasDiariasNecesarias(int dias) {
    double faltante = this.horasRestantes();
    return faltante / dias;
  }
  
  double eficienciaEstudio() {
    return (this.horasCompletadas / this.horasTotales) * 10;
  }
  
}