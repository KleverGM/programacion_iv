 print("Tipos de variables en dart");
  
 final String pokemon = "ditto";
 print(pokemon);
 
 String myname = "klever";
 myname = "hola";
 print(myname);
 
 const String elemento = "fuego";
 print("elemento: $elemento");
  
 bool active = false;
 active = false;
 print("es activo: $active");
  
 int hp = 1000;
 print("caballos de fuerza: $hp");
  
 List<String> abilities=["impostor", "correccion"];
 print("habilidades $abilities");
  
 final sprites = <String>["src/image.jpg", "image2"];
 print("Imagenes $sprites");
  
 print("Impresion en varias lineas");
 print("""
 $pokemon
 $hp
 $sprites
 $abilities
 """);
  
