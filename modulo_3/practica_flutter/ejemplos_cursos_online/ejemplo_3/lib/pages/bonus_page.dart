import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  String performanceLevel = 'Regular';
  String amountText = '';
  String resultText = '';

  void calculateBonus() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double percentage = 0;

    if (performanceLevel == 'Regular') {
      percentage = 5;
    } else if (performanceLevel == 'Bueno') {
      percentage = 10;
    } else if (performanceLevel == 'Excelente') {
      percentage = 15;
    }

    final bonus = amount * percentage / 100;
    final total = amount + bonus;

    setState(() {
      resultText =
        'Rendimiento: $performanceLevel\n'
        'Bonificación: ${percentage.toStringAsFixed(0)} %\n'
        'Valor bonificación: \$${bonus.toStringAsFixed(2)}\n'
        'Total con bonificación: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular bonificación'),
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
              'Bonificación según rendimiento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: performanceLevel,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Regular',
                  child: Text('Rendimiento regular'),
                ),
                DropdownMenuItem(
                  value: 'Bueno',
                  child: Text('Rendimiento bueno'),
                ),
                DropdownMenuItem(
                  value: 'Excelente',
                  child: Text('Rendimiento excelente'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  performanceLevel = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto base (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateBonus,
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