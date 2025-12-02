
// Importa los paquetes necesarios para la interfaz y navegación.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Página para calcular la sumatoria de créditos por semestre.
class CreditsSummaryPage extends StatefulWidget {
  const CreditsSummaryPage({super.key});

  @override
  State<CreditsSummaryPage> createState() => _CreditsSummaryPageState();
}

// Estado de la página, donde se guarda la información ingresada y el resultado.
class _CreditsSummaryPageState extends State<CreditsSummaryPage> {
  // Variable para almacenar el texto de la cantidad de materias.
  String subjectsCountText = '';
  // Variable para la cantidad de materias (como número).
  int subjectsCount = 0;

  // Listas de controladores para los campos de nombre y créditos de cada materia.
  final List<TextEditingController> subjectNameControllers = [];
  final List<TextEditingController> creditsControllers = [];

  // Variable para mostrar el resultado al usuario.
  String resultText = '';

  // Función que genera los campos para ingresar materias y créditos.
  void _generateSubjects() {
    // Convierte el texto ingresado a número.
    final parsed = int.tryParse(subjectsCountText) ?? 0;

    // Validación: solo permite entre 1 y 8 materias.
    if (parsed <= 0 || parsed > 8) {
      setState(() {
        resultText = 'Ingrese una cantidad de materias entre 1 y 8';
        subjectsCount = 0;
        subjectNameControllers.clear();
        creditsControllers.clear();
      });
      return;
    }

    // Actualiza la cantidad de materias y crea los controladores.
    subjectsCount = parsed;
    subjectNameControllers.clear();
    creditsControllers.clear();

    for (int i = 0; i < subjectsCount; i++) {
      subjectNameControllers.add(TextEditingController());
      creditsControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese nombre y créditos para cada materia.';
    });
  }

  // Función que calcula el total de créditos y el tipo de carga académica.
  void _calculateCredits() {
    // Validación: primero debe generar el formulario.
    if (subjectsCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántas materias tiene y genere el formulario.';
      });
      return;
    }

    int totalCredits = 0;
    final List<String> lines = [];

    // Recorre cada materia para sumar los créditos y mostrar el detalle.
    for (int i = 0; i < subjectsCount; i++) {
      // Si el nombre está vacío, pone "Materia X" por defecto.
      final name = subjectNameControllers[i].text.trim().isEmpty
          ? 'Materia ${i + 1}'
          : subjectNameControllers[i].text.trim();

      // Convierte el texto de créditos a número.
      final credits = int.tryParse(
            creditsControllers[i].text.trim(),
          ) ??
          0;

      totalCredits += credits;
      lines.add('- $name: $credits créditos');
    }

    // Determina el tipo de carga académica según el total de créditos.
    String loadType;
    if (totalCredits < 12) {
      loadType = 'Carga ligera';
    } else if (totalCredits <= 20) {
      loadType = 'Carga normal';
    } else {
      loadType = 'Carga pesada';
    }

    // Actualiza el resultado para mostrarlo en pantalla.
    setState(() {
      resultText =
        'Materias registradas:\n'
        '${lines.join('\n')}\n\n'
        'Total de créditos: $totalCredits\n'
        'Tipo de carga: $loadType';
    });
  }

  // Libera los recursos de los controladores cuando la página se destruye.
  @override
  void dispose() {
    for (final c in subjectNameControllers) {
      c.dispose();
    }
    for (final c in creditsControllers) {
      c.dispose();
    }
    super.dispose();
  }

  // Construye la interfaz de la página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título y botón para volver al menú principal.
      appBar: AppBar(
        title: const Text('Sumatoria de créditos'),
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
                'Créditos por semestre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Campo para ingresar la cantidad de materias.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de materias (1 - 8)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  subjectsCountText = value;
                },
              ),

              const SizedBox(height: 12),
              // Botón para generar los campos de materias.
              ElevatedButton(
                onPressed: _generateSubjects,
                child: const Text('Generar materias'),
              ),

              const SizedBox(height: 16),

              // Si hay materias, muestra los campos para nombre y créditos de cada una.
              if (subjectsCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjectsCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            // Campo para el nombre de la materia.
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: subjectNameControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Materia ${index + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Campo para los créditos de la materia.
                            Expanded(
                              child: TextField(
                                controller: creditsControllers[index],
                                decoration: const InputDecoration(
                                  labelText: 'Créditos',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),
              // Botón para calcular el total de créditos.
              if (subjectsCount > 0)
                ElevatedButton(
                  onPressed: _calculateCredits,
                  child: const Text('Calcular créditos totales'),
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
