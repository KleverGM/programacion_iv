import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudyHoursPage extends StatefulWidget {
  const StudyHoursPage({super.key});

  @override
  State<StudyHoursPage> createState() => _StudyHoursPageState();
}

class _StudyHoursPageState extends State<StudyHoursPage> {
  String difficultyText = '';
  String hoursPerTopicText = '';
  String resultText = '';

  void calculateStudyHours() {
    final difficulty = double.tryParse(difficultyText.replaceAll(',', '.')) ?? 0.0;
    final hoursPerTopic = double.tryParse(hoursPerTopicText.replaceAll(',', '.')) ?? 0.0;

    if (difficulty <= 0 || hoursPerTopic <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    final totalHours = difficulty * hoursPerTopic;

    setState(() {
      resultText =
        'Nivel de dificultad: ${difficulty.toStringAsFixed(1)}\n'
        'Horas por tema: ${hoursPerTopic.toStringAsFixed(2)} h/tema\n'
        'Horas totales requeridas: ${totalHours.toStringAsFixed(2)} horas';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horas de estudio requeridas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cálculo de horas según dificultad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Nivel de dificultad (1-10)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                difficultyText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Horas por tema',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                hoursPerTopicText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateStudyHours,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}