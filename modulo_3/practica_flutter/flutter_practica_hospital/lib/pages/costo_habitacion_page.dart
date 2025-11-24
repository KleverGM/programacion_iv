import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalCostPage extends StatefulWidget {
  const HospitalCostPage({super.key});

  @override
  State<HospitalCostPage> createState() => _HospitalCostPageState();
}

class _HospitalCostPageState extends State<HospitalCostPage> {
  String habitacion = 'general';
  String seguro = 'publico';

  String diasText = '';
  String costoText = '';
  String resultText = '';

  void calcularCosto() {
    final dias = double.tryParse(diasText.replaceAll(',', '.')) ?? 0.0;
    final costoDiario = double.tryParse(costoText.replaceAll(',', '.')) ?? 0.0;

    if (dias <= 0 || costoDiario <= 0) {
      setState(() {
        resultText = 'Ingrese los días y el costo diario';
      });
      return;
    }

    double factorHabitacion;
    if (habitacion == 'general') {
      factorHabitacion = 1.0;
    } else if (habitacion == 'semi') {
      factorHabitacion = 1.4;
    } else {
      factorHabitacion = 2.0;
    }

    double descuento;
    if (seguro == 'publico') {
      descuento = 0.30; 
    } else if (seguro == 'privado') {
      descuento = 0.50; 
    } else {
      descuento = 0.0;
    }

    double subtotal = dias * costoDiario * factorHabitacion;
    double total = subtotal - (subtotal * descuento);

    setState(() {
      resultText =
          'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
          'Descuento: ${(descuento * 100).toStringAsFixed(0)}%\n'
          'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de la hospitalizacion'),
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
                'Calcular costo total de la hospitalizacion',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Tipo de habitacion',
                  border: OutlineInputBorder(),
                ),
                value: habitacion,
                items: const [
                  DropdownMenuItem(value: 'general', child: Text('General')),
                  DropdownMenuItem(value: 'semi', child: Text('Semi-privada')),
                  DropdownMenuItem(value: 'privada', child: Text('Privada')),
                ],
                onChanged: (value) {
                  setState(() {
                    habitacion = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Seguro medico',
                  border: OutlineInputBorder(),
                ),
                value: seguro,
                items: const [
                  DropdownMenuItem(value: 'publico', child: Text('Publico')),
                  DropdownMenuItem(value: 'privado', child: Text('Privado')),
                  DropdownMenuItem(value: 'ninguno', child: Text('Sin seguro')),
                ],
                onChanged: (value) {
                  setState(() {
                    seguro = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Dias de hospitalizacion',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => diasText = value,
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Costo diario base',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => costoText = value,
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: calcularCosto,
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 16),

              Text(
                resultText,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
