
// Importa los paquetes necesarios para la interfaz y navegación.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Página para calcular el promedio de tres notas.
class AverageGradePage extends StatefulWidget {
  const AverageGradePage({super.key});

  @override
  State<AverageGradePage> createState() => _AverageGradePageState();
}

// Estado de la página, donde se guarda la información ingresada y el resultado.
class _AverageGradePageState extends State<AverageGradePage> {
  // Variables para almacenar el texto de cada nota ingresada.
  String n1Text = '';
  String n2Text = '';
  String n3Text = '';
  // Variable para mostrar el resultado al usuario.
  String resultText = '';

  // Función que calcula el promedio de las tres notas.
  void calculateAverage() {
    // Convierte los textos ingresados a números decimales.
    final n1 = double.tryParse(n1Text.replaceAll(',', '.')) ?? 0.0;
    final n2 = double.tryParse(n2Text.replaceAll(',', '.')) ?? 0.0;
    final n3 = double.tryParse(n3Text.replaceAll(',', '.')) ?? 0.0;

    // Validación: las notas no pueden ser negativas.
    if (n1 < 0 || n2 < 0 || n3 < 0) {
      setState(() {
        resultText = 'Las notas no pueden ser negativas';
      });
      return;
    }

    // Calcula el promedio.
    final average = (n1 + n2 + n3) / 3;
    // Determina el estado según el promedio.
    final status = average >= 7 ? 'APROBADO' : 'REPROBADO';

    // Actualiza el resultado para mostrarlo en pantalla.
    setState(() {
      resultText =
        'Notas: ${n1.toStringAsFixed(2)}, ${n2.toStringAsFixed(2)}, ${n3.toStringAsFixed(2)}\n'
        'Promedio: ${average.toStringAsFixed(2)}\n'
        'Estado: $status';
    });
  }

  // Construye la interfaz de la página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título y botón para volver al menú principal.
      appBar: AppBar(
        title: const Text('Promedio de notas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Navega al menú principal.
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título de la sección.
              const Text(
                'Calcular promedio de 3 notas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Campo para ingresar la primera nota.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nota 1',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  n1Text = value;
                },
              ),

              const SizedBox(height: 16),

              // Campo para ingresar la segunda nota.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nota 2',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  n2Text = value;
                },
              ),

              const SizedBox(height: 16),

              // Campo para ingresar la tercera nota.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nota 3',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  n3Text = value;
                },
              ),

              const SizedBox(height: 16),
              // Botón para calcular el promedio.
              ElevatedButton(
                onPressed: calculateAverage,
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 16),
              // Muestra el resultado del cálculo.
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
