import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnrollmentCalculatorPage extends StatefulWidget {
  const EnrollmentCalculatorPage({super.key});

  @override
  State<EnrollmentCalculatorPage> createState() => _EnrollmentCalculatorPageState();
}

class _EnrollmentCalculatorPageState extends State<EnrollmentCalculatorPage> {
  String courseType = 'Básico';
  String studentType = 'Regular';
  String priceText = '';
  String resultText = '';

  void calculateEnrollment() {
    final price = double.tryParse(priceText.replaceAll(',', '.')) ?? 0.0;

    if (price <= 0) {
      setState(() {
        resultText = 'Ingrese un precio válido';
      });
      return;
    }

    double discount = 0.0;

    // Descuentos por tipo de curso
    if (courseType == 'Básico') {
      discount = 5.0; // 5% de descuento
    } else if (courseType == 'Intermedio') {
      discount = 10.0; // 10% de descuento
    } else if (courseType == 'Avanzado') {
      discount = 15.0; // 15% de descuento
    }

    // Descuentos adicionales por tipo de estudiante
    if (studentType == 'Estudiante') {
      discount += 10.0; // 10% adicional
    } else if (studentType == 'Tercera edad') {
      discount += 15.0; // 15% adicional
    } else if (studentType == 'Empleado corporativo') {
      discount += 20.0; // 20% adicional
    }

    // Limitar descuento máximo al 50%
    if (discount > 50.0) discount = 50.0;

    final discountAmount = price * discount / 100;
    final finalPrice = price - discountAmount;

    setState(() {
      resultText =
        'Tipo de curso: $courseType\n'
        'Tipo de estudiante: $studentType\n'
        'Descuento total: ${discount.toStringAsFixed(1)}%\n'
        'Ahorro: \$${discountAmount.toStringAsFixed(2)}\n'
        'Precio final: \$${finalPrice.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de matrícula'),
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
              'Calcula el costo con descuentos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: courseType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Curso Básico'),
                ),
                DropdownMenuItem(
                  value: 'Intermedio',
                  child: Text('Curso Intermedio'),
                ),
                DropdownMenuItem(
                  value: 'Avanzado',
                  child: Text('Curso Avanzado'),
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

            DropdownButton<String>(
              value: studentType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Regular',
                  child: Text('Estudiante regular'),
                ),
                DropdownMenuItem(
                  value: 'Estudiante',
                  child: Text('Estudiante universitario'),
                ),
                DropdownMenuItem(
                  value: 'Tercera edad',
                  child: Text('Tercera edad'),
                ),
                DropdownMenuItem(
                  value: 'Empleado corporativo',
                  child: Text('Empleado corporativo'),
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
                labelText: 'Precio original (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                priceText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateEnrollment,
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