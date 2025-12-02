
// Importa el paquete principal de Flutter para crear interfaces gráficas.
import 'package:flutter/material.dart';
// Importa el archivo donde se configura la navegación de la app.
import 'app_router.dart';

// Función principal que inicia la aplicación.
void main() {
  // runApp es el método que arranca la app y recibe el widget raíz.
  runApp(const UniversityApp());
}

// Widget principal de la aplicación.
class UniversityApp extends StatelessWidget {
  const UniversityApp({super.key});

  // Este método construye la interfaz principal de la app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Título de la aplicación.
      title: 'Universidad - Admisiones',
      // Configuración del tema visual (colores, estilos).
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // Configuración del router para la navegación entre páginas.
      routerConfig: appRouter,
    );
  }
}
