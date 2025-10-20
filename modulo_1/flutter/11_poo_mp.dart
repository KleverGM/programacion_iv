void main() {
  print("Programacion orientada a objetos en aplicacion de cursos online");
  
  final Curso cursoFlutter = Curso(nombre: 'desarrollo con flutter', categoria: 'movil');
  print(cursoFlutter);
  print("Nombre del curso: ${cursoFlutter.nombre}");
  print("Categoria: ${cursoFlutter.categoria}");
  
  final Curso cursoPython = Curso(nombre: 'python basico');
  print(cursoPython);
}

class Curso {
  String nombre = "";
  String categoria = "";
  
  Curso({required this.nombre, this.categoria = "programacion"});
  
  @override
  String toString() {
    return "$nombre - $categoria";
  }
}