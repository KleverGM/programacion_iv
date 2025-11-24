import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursesHomePage extends StatelessWidget {
  const CoursesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Cursos Online')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/enrollment'),
              child: const Text('Calculadora de matrícula'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/progress'),
              child: const Text('Seguimiento de progreso'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/certification'),
              child: const Text('Costo de certificación'),
            ),
          ],
        ),
      ),
    );
  }
}