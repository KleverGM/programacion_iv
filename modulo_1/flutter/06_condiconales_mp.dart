void main() {
  print("Condicionales en aplicacion de cursos online");
  
  int modulosCompletados = 2;
  if (modulosCompletados > 2) {
    print('Has completado mas de 2 modulos');
  } 
  if (modulosCompletados < 2) {
    print('Has completado menos de 2 modulos');
  }
  if (modulosCompletados == 2) {
  print('Has completado exactamente 2 modulos');
  }
  
  if (modulosCompletados > 2) {
    print('Has avanzado bastante en el curso');
  } else {
    print('Estas comenzando el curso');
  }
  if (modulosCompletados < 2) {
    print('Necesitas avanzar mas en el curso');
  } else {
    print('Vas por buen camino');
  }
  if (modulosCompletados == 2) {
  print('Estas a mitad del curso');
  } else {
    print('No estas exactamente a mitad del curso');
  }
  
  int calificacion = 7;
  
  if (calificacion > 7) {
    print('Calificacion sobresaliente');
  } else if (calificacion < 7) {
    print('Calificacion insuficiente');
  } else {
    print('Calificacion aprobatoria');
  }
  
  int edad = 18;
  String tipoUsuario = edad >= 18 ? 'Usuario adulto' : 'Usuario menor';
  print(tipoUsuario);
}