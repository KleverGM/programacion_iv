void main() {
  print("Funciones en aplicacion de cursos online");
  
  print(bienvenidaPlataforma());
  print(calcularPuntajeTotal(30, 15));
  print(calcularDuracionCurso(6, 10));
  print(calcularDuracionCurso(8));
  print(generarMensajeUsuario(nombre: "Luis", mensaje: "Bienvenido de nuevo"));
  print(generarMensajeUsuario(nombre: "Juan"));
}

String bienvenidaPlataforma() => 'Bienvenido a la plataforma de cursos online';

int calcularPuntajeTotal(int puntajeExamen, int puntajeTareas) => puntajeExamen + puntajeTareas;

int calcularDuracionCurso(int modulos, [int minutosPorModulo = 45]) {
  return modulos * minutosPorModulo;
}
  
String generarMensajeUsuario({required String nombre, String mensaje = "Hola"}) {
  return '$mensaje $nombre, disfruta tus cursos';
}