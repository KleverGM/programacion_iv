import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseTotalPage extends StatefulWidget {
  const CourseTotalPage({super.key});

  @override
  State<CourseTotalPage> createState() => _CourseTotalPageState();
}

class _CourseTotalPageState extends State<CourseTotalPage> {
  String subtotalText = '';
  String resultText = '';

  void calculateTotal() {
    final subtotal = double.tryParse(subtotalText.replaceAll(',', '.')) ?? 0.0;

    if (subtotal <= 0) {
      setState(() {
        resultText = 'Ingrese un subtotal válido';
      });
      return;
    }

    const taxRate = 0.12;
    final tax = subtotal * taxRate;
    final total = subtotal + tax;

    setState(() {
      resultText =
        'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
        'Impuesto (12%): \$${tax.toStringAsFixed(2)}\n'
        'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total con impuestos'),
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
              'Calcular total del curso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Subtotal (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                subtotalText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTotal,
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