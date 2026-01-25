import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudyPerformancePage extends StatefulWidget {
  const StudyPerformancePage({super.key});

  @override
  State<StudyPerformancePage> createState() => _StudyPerformancePageState();
}

class _StudyPerformancePageState extends State<StudyPerformancePage> {
  String completedCoursesText = '';
  String totalCoursesText = '';
  String resultText = '';

  void calculatePerformance() {
    final completedCourses = double.tryParse(completedCoursesText.replaceAll(',', '.')) ?? 0.0;
    final totalCourses = double.tryParse(totalCoursesText.replaceAll(',', '.')) ?? 0.0;

    if (completedCourses <= 0 || totalCourses <= 0 || completedCourses > totalCourses) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    final performance = (completedCourses / totalCourses) * 100;
    String category;

    if (performance < 60) {
      category = 'Bajo rendimiento';
    } else if (performance < 75) {
      category = 'Rendimiento regular';
    } else if (performance < 90) {
      category = 'Buen rendimiento';
    } else {
      category = 'Excelente rendimiento';
    }

    setState(() {
      resultText =
        'Rendimiento: ${performance.toStringAsFixed(2)}%\n'
        'Categoría: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rendimiento académico'),
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
              'Cálculo de rendimiento académico',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Cursos completados',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                completedCoursesText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Total de cursos inscritos',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalCoursesText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculatePerformance,
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