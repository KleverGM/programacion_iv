void main() {
print("Maps para aplicacion de cursos online");
 final Map <String, dynamic> curso = {
   'nombre': 'desarrollo flutter',
   'duracion': 120,
   'disponible': true,
   'temas': <String>['widgets', 'navegacion', 'estado'],
   'recursos': {
     1: 'assets/presentacion.pdf',
     2: 'assets/codigo_ejemplo.zip'
   }
 };
 print(curso);
 print(curso['nombre']);
 print(curso['recursos']);
 print(curso['disponible']);
}