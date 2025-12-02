
// Importa los paquetes necesarios para la interfaz y navegación.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Página para calcular propinas en un restaurante.
class RestaurantePage extends StatefulWidget {
  const RestaurantePage({super.key});

  @override
  State<RestaurantePage> createState() => _RestaurantePageState();
}

// Estado de la página, donde se guarda la información ingresada y el resultado.
class _RestaurantePageState extends State<RestaurantePage> {
  // Variables para almacenar la cantidad de mesas y el porcentaje de propina.
  String tablesCountText = '';
  int tablesCount = 0;
  double tipPercentage = 10.0;

  // Lista de controladores para los campos de consumo de cada mesa.
  final List<TextEditingController> consumptionControllers = [];

  // Variable para mostrar el resultado al usuario.
  String resultText = '';

  // Función que genera los campos para ingresar el consumo de cada mesa.
  void _generateTables() {
    // Convierte el texto ingresado a número.
    final parsed = int.tryParse(tablesCountText) ?? 0;

    // Validación: solo permite entre 1 y 10 mesas.
    if (parsed <= 0 || parsed > 10) {
      setState(() {
        resultText = 'Ingrese una cantidad de mesas entre 1 y 10';
        tablesCount = 0;
        consumptionControllers.clear();
      });
      return;
    }

    // Actualiza la cantidad de mesas y crea los controladores.
    tablesCount = parsed;
    consumptionControllers.clear();

    for (int i = 0; i < tablesCount; i++) {
      consumptionControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese el consumo para cada mesa.';
    });
  }

  // Función que calcula el total de propinas y el resumen por mesa.
  void _calculateTips() {
    // Validación: primero debe generar el formulario.
    if (tablesCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántas mesas atendió y genere el formulario.';
      });
      return;
    }

    double totalConsumption = 0;
    double totalTips = 0;
    double grandTotal = 0;
    final List<String> lines = [];

    // Recorre cada mesa para sumar el consumo y calcular la propina.
    for (int i = 0; i < tablesCount; i++) {
      final consumptionText = consumptionControllers[i].text.trim();
      
      // Validación: el campo no puede estar vacío.
      if (consumptionText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Por favor ingrese el consumo de la mesa ${i + 1}'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Convierte el texto de consumo a número.
      final consumption = double.tryParse(consumptionText) ?? 0;
      
      // Validación: el consumo debe ser mayor a cero.
      if (consumption <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ingrese un valor válido para la mesa ${i + 1}'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Calcula la propina y el total por mesa.
      final tip = consumption * (tipPercentage / 100);
      final total = consumption + tip;

      totalConsumption += consumption;
      totalTips += tip;
      grandTotal += total;

      lines.add('Mesa ${i + 1}: \$${consumption.toStringAsFixed(2)} + \$${tip.toStringAsFixed(2)} = \$${total.toStringAsFixed(2)}');
    }

    // Actualiza el resultado para mostrarlo en pantalla.
    setState(() {
      resultText =
        'Resumen de propinas:\n'
        '${lines.join('\n')}\n\n'
        'Total consumo: \$${totalConsumption.toStringAsFixed(2)}\n'
        'Total propinas ($tipPercentage%): \$${totalTips.toStringAsFixed(2)}\n'
        'TOTAL GENERAL: \$${grandTotal.toStringAsFixed(2)}';
    });
  }

  // Libera los recursos de los controladores cuando la página se destruye.
  @override
  void dispose() {
    for (final c in consumptionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  // Construye la interfaz de la página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título y botón para volver al menú principal.
      appBar: AppBar(
        title: const Text('Calculadora de Propinas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Navega al menú principal.
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título de la sección.
              const Text(
                'Propinas por mesa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Campo para ingresar la cantidad de mesas.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de mesas (1 - 10)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tablesCountText = value;
                },
              ),

              const SizedBox(height: 12),

              // Selector para el porcentaje de propina.
              Row(
                children: [
                  const Text('Porcentaje de propina: '),
                  DropdownButton<double>(
                    value: tipPercentage,
                    items: const [
                      DropdownMenuItem(value: 10.0, child: Text('10%')),
                      DropdownMenuItem(value: 12.0, child: Text('12%')),
                      DropdownMenuItem(value: 15.0, child: Text('15%')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        tipPercentage = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),
              // Botón para generar los campos de consumo por mesa.
              ElevatedButton(
                onPressed: _generateTables,
                child: const Text('Generar mesas'),
              ),

              const SizedBox(height: 16),

              // Si hay mesas, muestra los campos para consumo de cada una.
              if (tablesCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tablesCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: consumptionControllers[index],
                          decoration: InputDecoration(
                            labelText: 'Consumo Mesa ${index + 1} (\$)',
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),
              // Botón para calcular el total de propinas.
              if (tablesCount > 0)
                ElevatedButton(
                  onPressed: _calculateTips,
                  child: const Text('Calcular propinas'),
                ),

              const SizedBox(height: 16),
              // Muestra el resultado del cálculo.
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
