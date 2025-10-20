void main() {
 print("Tipos de variables en una aplicacion de cursos online");
  
 final String courseName = "Flutter avanzado";
 print(courseName);
 
 String instructorName = "Ana";
 instructorName = "Ana Rodriguez";
 print(instructorName);
 
 const String category = "desarrollo movil";
 print("Categoria: $category");
  
 bool isAvailable = true;
 isAvailable = false;
 print("Esta disponible: $isAvailable");
  
 int duration = 120;
 print("Duracion en minutos: $duration");
  
 List<String> topics = ["widgets", "estado", "navegacion"];
 print("Temas del curso: $topics");
  
 final resources = <String>["assets/slides.pdf", "assets/codigo_ejemplo.zip"];
 print("Recursos: $resources");

 print("Informacion completa del curso:");
 print("""
 $courseName
 $duration
 $resources
 $topics
 """);
}
  