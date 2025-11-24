import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressTrackerPage extends StatefulWidget {
  const ProgressTrackerPage({super.key});

  @override
  State<ProgressTrackerPage> createState() => _ProgressTrackerPageState();
}

class _ProgressTrackerPageState extends State<ProgressTrackerPage> {
  String courseType = 'Corto';
  String completedLessonsText = '';
  String totalLessonsText = '';
  String hoursPerWeekText = '';
  String resultText = '';

  void calculateProgress() {
    final completedLessons = int.tryParse(completedLessonsText) ?? 0;
    final totalLessons = int.tryParse(totalLessonsText) ?? 0;
    final hoursPerWeek = double.tryParse(hoursPerWeekText.replaceAll(',', '.')) ?? 0.0;

    if (completedLessons < 0 || totalLessons <= 0 || hoursPerWeek <= 0 || completedLessons > totalLessons) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    double hoursPerLesson = 0.0;

    if (courseType == 'Corto') {
      hoursPerLesson = 0.5; // 30 minutos por lección
    } else if (courseType == 'Medio') {
      hoursPerLesson = 1.0; // 1 hora por lección
    } else if (courseType == 'Largo') {
      hoursPerLesson = 1.5; // 1.5 horas por lección
    }

    final progressPercentage = (completedLessons / totalLessons) * 100;
    final remainingLessons = totalLessons - completedLessons;
    final totalHoursRemaining = remainingLessons * hoursPerLesson;
    final weeksToComplete = totalHoursRemaining / hoursPerWeek;
    final totalCourseHours = totalLessons * hoursPerLesson;
    final completedHours = completedLessons * hoursPerLesson;

    setState(() {
      resultText =
        'Tipo de curso: $courseType\n'
        'Progreso: ${progressPercentage.toStringAsFixed(1)}%\n'
        'Lecciones completadas: $completedLessons de $totalLessons\n'
        'Horas completadas: ${completedHours.toStringAsFixed(1)} de ${totalCourseHours.toStringAsFixed(1)}\n'
        'Tiempo estimado para completar: ${weeksToComplete.toStringAsFixed(1)} semanas\n'
        'Horas restantes: ${totalHoursRemaining.toStringAsFixed(1)} horas';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de progreso'),
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
              'Calcula tu progreso del curso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: courseType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Corto',
                  child: Text('Curso corto'),
                ),
                DropdownMenuItem(
                  value: 'Medio',
                  child: Text('Curso medio'),
                ),
                DropdownMenuItem(
                  value: 'Largo',
                  child: Text('Curso extenso'),
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

            TextField(
              decoration: const InputDecoration(
                labelText: 'Lecciones completadas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                completedLessonsText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Total de lecciones',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalLessonsText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Horas de estudio por semana',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                hoursPerWeekText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateProgress,
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