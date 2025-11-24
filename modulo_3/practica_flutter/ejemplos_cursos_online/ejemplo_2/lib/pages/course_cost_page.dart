import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseCostPage extends StatefulWidget {
  const CourseCostPage({super.key});

  @override
  State<CourseCostPage> createState() => _CourseCostPageState();
}

class _CourseCostPageState extends State<CourseCostPage> {
  String studentType = 'Regular';
  String baseCostText = '';
  String resultText = '';

  void calculateCost() {
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    if (baseCost <= 0) {
      setState(() {
        resultText = 'Ingrese un costo base válido';
      });
      return;
    }

    double discount = 0;

    if (studentType == 'Regular') {
      discount = 0;
    } else if (studentType == 'Beca académica') {
      discount = 30;
    } else if (studentType == 'Beca completa') {
      discount = 100;
    }

    final discountAmount = baseCost * discount / 100;
    final finalCost = baseCost - discountAmount;

    setState(() {
      resultText =
        'Tipo de estudiante: $studentType\n'
        'Descuento: ${discount.toStringAsFixed(0)} %\n'
        'Monto de descuento: \$${discountAmount.toStringAsFixed(2)}\n'
        'Costo final: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo por sesión tutorial'),
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
              'Costo de tutoría según tipo de beca',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: studentType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Regular',
                  child: Text('Estudiante regular'),
                ),
                DropdownMenuItem(
                  value: 'Beca académica',
                  child: Text('Estudiante con beca académica'),
                ),
                DropdownMenuItem(
                  value: 'Beca completa',
                  child: Text('Estudiante con beca completa'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  studentType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo base por sesión (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseCostText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateCost,
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