import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlineacionBalanceoPage extends StatefulWidget {
  const AlineacionBalanceoPage({super.key});

  @override
  State<AlineacionBalanceoPage> createState() => _AlineacionBalanceoPageState();
}

class _AlineacionBalanceoPageState extends State<AlineacionBalanceoPage> {
  String tipoVehiculo = 'Auto';
  String tipoServicio = 'Solo alineación';
  String cantidadLlantasText = '';
  String resultText = '';

  // Tarifas por tipo de vehículo
  final Map<String, double> tarifasVehiculo = {
    'Auto': 10.0,
    'Camioneta': 15.0,
    'Camión': 25.0,
  };

  // Costos por llanta según el tipo de servicio
  final Map<String, double> costosPorLlanta = {
    'Solo alineación': 8.0,
    'Solo balanceo': 5.0,
    'Ambos': 12.0,
  };

  void calcularCosto() {
    if (cantidadLlantasText.isEmpty) {
      setState(() {
        resultText = 'Por favor ingrese la cantidad de llantas';
      });
      return;
    }

    int cantidadLlantas = int.tryParse(cantidadLlantasText) ?? 0;
    
    if (cantidadLlantas < 2 || cantidadLlantas > 6) {
      setState(() {
        resultText = 'La cantidad de llantas debe ser entre 2 y 6';
      });
      return;
    }

    double tarifaVehiculo = tarifasVehiculo[tipoVehiculo] ?? 0;
    double costoPorLlanta = costosPorLlanta[tipoServicio] ?? 0;
    double costoTotal = tarifaVehiculo + (costoPorLlanta * cantidadLlantas);

    String clasificacion;
    if (costoTotal < 50) {
      clasificacion = 'Trabajo pequeño';
    } else if (costoTotal <= 100) {
      clasificacion = 'Trabajo medio';
    } else {
      clasificacion = 'Trabajo grande';
    }

    setState(() {
      resultText = '''
Tipo de vehículo: $tipoVehiculo
Tipo de servicio: $tipoServicio
Cantidad de llantas: $cantidadLlantas

Tarifa base ($tipoVehiculo): \$${tarifaVehiculo.toStringAsFixed(2)}
Costo por llantas ($cantidadLlantas x \$${costoPorLlanta.toStringAsFixed(2)}): \$${(costoPorLlanta * cantidadLlantas).toStringAsFixed(2)}

Costo total: \$${costoTotal.toStringAsFixed(2)}
Clasificación: $clasificacion
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alineación y balanceo'),
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
              'Servicio de alineación y balanceo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: tipoVehiculo,
              isExpanded: true,
              hint: const Text('Seleccione tipo de vehículo'),
              items: const [
                DropdownMenuItem(
                  value: 'Auto',
                  child: Text('Auto (\$10)'),
                ),
                DropdownMenuItem(
                  value: 'Camioneta',
                  child: Text('Camioneta (\$15)'),
                ),
                DropdownMenuItem(
                  value: 'Camión',
                  child: Text('Camión (\$25)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  tipoVehiculo = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: tipoServicio,
              isExpanded: true,
              hint: const Text('Seleccione tipo de servicio'),
              items: const [
                DropdownMenuItem(
                  value: 'Solo alineación',
                  child: Text('Solo alineación (\$8 por llanta)'),
                ),
                DropdownMenuItem(
                  value: 'Solo balanceo',
                  child: Text('Solo balanceo (\$5 por llanta)'),
                ),
                DropdownMenuItem(
                  value: 'Ambos',
                  child: Text('Alineación y balanceo (\$12 por llanta)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  tipoServicio = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de llantas (2-6)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cantidadLlantasText = value;
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: calcularCosto,
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

