
// Importa los paquetes necesarios para la interfaz y navegación.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Página principal del menú de admisiones.
class AdmissionsHomePage extends StatelessWidget {
  const AdmissionsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título.
      appBar: AppBar(title: const Text('Menú Admisiones')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Texto de instrucción.
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Botón para ir a la página de promedio de notas.
            ElevatedButton(
              onPressed: () => context.go('/average'),
              child: const Text('Promedio de notas'),
            ),
            const SizedBox(height: 12),

            // Botón para ir a la página de cálculo de matrícula.
            ElevatedButton(
              onPressed: () => context.go('/tuition'),
              child: const Text('Cálculo de matrícula'),
            ),
            const SizedBox(height: 12),

            // Botón para ir a la página de derechos de inscripción.
            ElevatedButton(
              onPressed: () => context.go('/fees'),
              child: const Text('Derechos de inscripción'),
            ),
            const SizedBox(height: 12),

            // Botón para ir a la página de sumatoria de créditos.
            ElevatedButton(
              onPressed: () => context.go('/credits'),
              child: const Text('Sumatoria de créditos'),
            ),
            const SizedBox(height: 12),
            // Botón para ir a la calculadora de propinas del restaurante.
            ElevatedButton(
              onPressed: () => context.go('/restaurante'),
              child: const Text('Calculadora de propinas restaurante'),
            ),
          ],
        ),
      ),
    );
  }
}
