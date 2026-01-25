import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearningEfficiencyPage extends StatefulWidget {
  const LearningEfficiencyPage({super.key});

  @override
  State<LearningEfficiencyPage> createState() => _LearningEfficiencyPageState();
}

class _LearningEfficiencyPageState extends State<LearningEfficiencyPage> {
  String courseType = 'básico';
  String studyMethod = 'tradicional';

  String hoursText = '';
  String topicsText = '';
  String resultText = '';

  void calculateEfficiency() {
    final hours = double.tryParse(hoursText.replaceAll(',', '.')) ?? 0.0;
    final topics = double.tryParse(topicsText.replaceAll(',', '.')) ?? 0.0;

    if (hours <= 0 || topics <= 0) {
      setState(() {
        resultText = 'Ingrese las horas y los temas estudiados';
      });
      return;
    }

    double difficultyFactor;
    if (courseType == 'básico') {
      difficultyFactor = 1.0;
    } else if (courseType == 'intermedio') {
      difficultyFactor = 1.4;
    } else {
      difficultyFactor = 2.0;
    }

    double methodBonus;
    if (studyMethod == 'tradicional') {
      methodBonus = 1.0;
    } else if (studyMethod == 'interactivo') {
      methodBonus = 1.3;
    } else {
      methodBonus = 1.5;
    }

    double baseEfficiency = topics / hours;
    double adjustedEfficiency = baseEfficiency * difficultyFactor * methodBonus;

    setState(() {
      resultText =
          'Eficiencia base: ${baseEfficiency.toStringAsFixed(2)} temas/hora\n'
          'Factor de dificultad: ${difficultyFactor}x\n'
          'Bonus por método: ${methodBonus}x\n'
          'Eficiencia ajustada: ${adjustedEfficiency.toStringAsFixed(2)} puntos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eficiencia de aprendizaje'),
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
                'Calcular eficiencia de aprendizaje',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const Text(
                'Tipo de curso:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: courseType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'básico',
                    child: Text('Curso básico'),
                  ),
                  DropdownMenuItem(
                    value: 'intermedio',
                    child: Text('Curso intermedio'),
                  ),
                  DropdownMenuItem(
                    value: 'avanzado',
                    child: Text('Curso avanzado'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    courseType = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Método de estudio:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: studyMethod,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'tradicional',
                    child: Text('Método tradicional'),
                  ),
                  DropdownMenuItem(
                    value: 'interactivo',
                    child: Text('Método interactivo'),
                  ),
                  DropdownMenuItem(
                    value: 'gamificado',
                    child: Text('Método gamificado'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    studyMethod = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Horas de estudio',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  hoursText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Temas completados',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  topicsText = value;
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateEfficiency,
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