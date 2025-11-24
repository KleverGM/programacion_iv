import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursePlanPage extends StatefulWidget {
  const CoursePlanPage({super.key});

  @override
  State<CoursePlanPage> createState() => _CoursePlanPageState();
}

class _CoursePlanPageState extends State<CoursePlanPage> {

  String weeksText = '';
  String studentsText = '';
  String basePriceText = '';

  String level = 'Básico';

  String modality = 'Online'; 

  bool includeCertificate = false;
  bool includeTutoring = false;

  String resultText = '';

  void calculatePackage() {
    final weeks = int.tryParse(weeksText) ?? 0;
    final students = int.tryParse(studentsText) ?? 0;
    final basePrice = double.tryParse(basePriceText.replaceAll(',', '.')) ?? 0.0;

    if (weeks <= 0 || students <= 0 || basePrice <= 0) {
      setState(() {
        resultText = 'Ingrese semanas, estudiantes y precio base válidos';
      });
      return;
    }

    double levelFactor = 0; 
    if (level == 'Básico') {
      levelFactor = 0; 
    } else if (level == 'Intermedio') {
      levelFactor = 15; 
    } else if (level == 'Avanzado') {
      levelFactor = 25; 
    }

    double modalityFactor = 0;
    if (modality == 'Online') {
      modalityFactor = 0; 
    } else if (modality == 'Híbrida') {
      modalityFactor = 20;
    } else if (modality == 'Presencial') {
      modalityFactor = 35;
    }

    final baseTotal = basePrice * weeks * students;

    final levelExtra = baseTotal * (levelFactor / 100);
    final modalityExtra = baseTotal * (modalityFactor / 100);

    double subtotal = baseTotal + levelExtra + modalityExtra;

    if (includeCertificate) {
      subtotal += subtotal * 0.10; // +10%
    }
    if (includeTutoring) {
      subtotal += subtotal * 0.15; // +15%
    }

    final pricePerStudent = subtotal / students;

    setState(() {
      resultText =
        'Nivel: $level\n'
        'Modalidad: $modality\n'
        'Incluye certificado: ${includeCertificate ? 'Sí' : 'No'}\n'
        'Incluye tutoría: ${includeTutoring ? 'Sí' : 'No'}\n'
        'Precio por estudiante: \$${pricePerStudent.toStringAsFixed(2)}\n'
        'Total general: \$${subtotal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular paquete de cursos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configure su paquete de cursos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Duración en semanas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  weeksText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número de estudiantes',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  studentsText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Precio base por semana/estudiante (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  basePriceText = value;
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Nivel del curso:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: level,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Básico',
                    child: Text('Básico'),
                  ),
                  DropdownMenuItem(
                    value: 'Intermedio',
                    child: Text('Intermedio (+15%)'),
                  ),
                  DropdownMenuItem(
                    value: 'Avanzado',
                    child: Text('Avanzado (+25%)'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    level = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Modalidad:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              RadioListTile<String>(
                title: const Text('Online'),
                value: 'Online',
                groupValue: modality,
                onChanged: (value) {
                  setState(() {
                    modality = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Híbrida (+20%)'),
                value: 'Híbrida',
                groupValue: modality,
                onChanged: (value) {
                  setState(() {
                    modality = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Presencial (+35%)'),
                value: 'Presencial',
                groupValue: modality,
                onChanged: (value) {
                  setState(() {
                    modality = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Servicios adicionales:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              CheckboxListTile(
                title: const Text('Incluir certificado (+10%)'),
                value: includeCertificate,
                onChanged: (value) {
                  setState(() {
                    includeCertificate = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Incluir tutoría personalizada (+15%)'),
                value: includeTutoring,
                onChanged: (value) {
                  setState(() {
                    includeTutoring = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculatePackage,
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}