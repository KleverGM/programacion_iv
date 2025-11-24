import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupDiscountPage extends StatefulWidget {
  const GroupDiscountPage({super.key});

  @override
  State<GroupDiscountPage> createState() => _GroupDiscountPageState();
}

class _GroupDiscountPageState extends State<GroupDiscountPage> {
  String totalText = '';
  String studentsText = '';
  String resultText = '';

  void calculateGroupDiscount() {
    final total = double.tryParse(totalText.replaceAll(',', '.')) ?? 0.0;
    final students = int.tryParse(studentsText) ?? 0;

    if (total <= 0 || students <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    double discount = 0;
    
    if (students >= 2 && students < 5) {
      discount = 10;
    } else if (students >= 5 && students < 10) {
      discount = 15;
    } else if (students >= 10) {
      discount = 25;
    }

    final discountAmount = total * discount / 100;
    final finalTotal = total - discountAmount;
    final perStudent = finalTotal / students;

    setState(() {
      resultText =
        'Total original: \$${total.toStringAsFixed(2)}\n'
        'Estudiantes: $students\n'
        'Descuento grupal: ${discount.toStringAsFixed(0)}%\n'
        'Ahorro total: \$${discountAmount.toStringAsFixed(2)}\n'
        'Total con descuento: \$${finalTotal.toStringAsFixed(2)}\n'
        'A pagar por estudiante: \$${perStudent.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descuento grupal'),
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
              'Calcular descuento para grupos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Total del curso (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalText = value;
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
            ElevatedButton(
              onPressed: calculateGroupDiscount,
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