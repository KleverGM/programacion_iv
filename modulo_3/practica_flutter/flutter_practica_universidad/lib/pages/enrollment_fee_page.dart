
// Importa los paquetes necesarios para la interfaz y navegación.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Página para calcular el total de derechos de inscripción.
class EnrollmentFeePage extends StatefulWidget {
  const EnrollmentFeePage({super.key});

  @override
  State<EnrollmentFeePage> createState() => _EnrollmentFeePageState();
}

// Estado de la página, donde se guarda la información ingresada y el resultado.
class _EnrollmentFeePageState extends State<EnrollmentFeePage> {
  // Variables para almacenar los valores ingresados por el usuario.
  String inscriptionText = '';
  String idCardText = '';
  String labFeeText = '';
  // Variable para mostrar el resultado al usuario.
  String resultText = '';

  // Función que calcula el total de derechos de inscripción.
  void calculateFees() {
    // Convierte los textos ingresados a números decimales.
    final inscription = double.tryParse(inscriptionText.replaceAll(',', '.')) ?? 0.0;
    final idCard = double.tryParse(idCardText.replaceAll(',', '.')) ?? 0.0;
    final labFee = double.tryParse(labFeeText.replaceAll(',', '.')) ?? 0.0;

    // Validación: los valores no pueden ser negativos.
    if (inscription < 0 || idCard < 0 || labFee < 0) {
      setState(() {
        resultText = 'Los valores no pueden ser negativos';
      });
      return;
    }

    // Calcula el total sumando los tres valores.
    final total = inscription + idCard + labFee;

    // Actualiza el resultado para mostrarlo en pantalla.
    setState(() {
      resultText =
        'Inscripción: \$${inscription.toStringAsFixed(2)}\n'
        'Carnet estudiantil: \$${idCard.toStringAsFixed(2)}\n'
        'Laboratorio: \$${labFee.toStringAsFixed(2)}\n'
        'Total derechos de inscripción: \$${total.toStringAsFixed(2)}';
    });
  }

  // Construye la interfaz de la página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título y botón para volver al menú principal.
      appBar: AppBar(
        title: const Text('Derechos de inscripción'),
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
                'Cálculo de derechos de inscripción',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Campo para ingresar el valor de inscripción.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Inscripción (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  inscriptionText = value;
                },
              ),

              const SizedBox(height: 16),

              // Campo para ingresar el valor del carnet estudiantil.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Carnet estudiantil (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  idCardText = value;
                },
              ),

              const SizedBox(height: 16),

              // Campo para ingresar el valor del laboratorio.
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Laboratorio (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  labFeeText = value;
                },
              ),

              const SizedBox(height: 16),
              // Botón para calcular el total.
              ElevatedButton(
                onPressed: calculateFees,
                child: const Text('Calcular'),
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
