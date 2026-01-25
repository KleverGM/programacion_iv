import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursePackagesPage extends StatefulWidget {
  const CoursePackagesPage({super.key});

  @override
  State<CoursePackagesPage> createState() => _CoursePackagesPageState();
}

class _CoursePackagesPageState extends State<CoursePackagesPage> {
  String basicType = 'Programación';
  String advancedType = 'Diseño';
  String specialtyType = 'Marketing';
  String basicQuantityText = '';
  String advancedQuantityText = '';
  String specialtyQuantityText = '';
  String resultText = '';

  void calculateTotal() {
    final basicQuantity = int.tryParse(basicQuantityText) ?? 0;
    final advancedQuantity = int.tryParse(advancedQuantityText) ?? 0;
    final specialtyQuantity = int.tryParse(specialtyQuantityText) ?? 0;

    if (basicQuantity <= 0 || advancedQuantity <= 0 || specialtyQuantity <= 0) {
      setState(() {
        resultText = 'Error: Todas las cantidades deben ser mayores a 0';
      });
      return;
    }

    // Precios de cursos básicos
    double basicPrice = 0.0;
    if (basicType == 'Programación') {
      basicPrice = 100.0;
    } else if (basicType == 'Ofimática') {
      basicPrice = 80.0;
    } else if (basicType == 'Inglés') {
      basicPrice = 90.0;
    }

    // Precios de cursos avanzados
    double advancedPrice = 0.0;
    if (advancedType == 'Diseño') {
      advancedPrice = 150.0;
    } else if (advancedType == 'Marketing') {
      advancedPrice = 120.0;
    } else if (advancedType == 'Contabilidad') {
      advancedPrice = 110.0;
    }

    // Precios de especialidades
    double specialtyPrice = 0.0;
    if (specialtyType == 'Marketing') {
      specialtyPrice = 200.0;
    } else if (specialtyType == 'Data Science') {
      specialtyPrice = 250.0;
    } else if (specialtyType == 'Idiomas') {
      specialtyPrice = 180.0;
    }

    final basicSubtotal = basicPrice * basicQuantity;
    final advancedSubtotal = advancedPrice * advancedQuantity;
    final specialtySubtotal = specialtyPrice * specialtyQuantity;
    final totalGeneral = basicSubtotal + advancedSubtotal + specialtySubtotal;

    setState(() {
      resultText =
          'Subtotal Básicos ($basicType x $basicQuantity): \$${basicSubtotal.toStringAsFixed(2)}\n'
          'Subtotal Avanzados ($advancedType x $advancedQuantity): \$${advancedSubtotal.toStringAsFixed(2)}\n'
          'Subtotal Especialidades ($specialtyType x $specialtyQuantity): \$${specialtySubtotal.toStringAsFixed(2)}\n'
          'Total General: \$${totalGeneral.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquetes de cursos'),
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
                'Calcular total de paquetes de cursos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Text(
                'Cursos básicos:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: basicType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Programación',
                    child: Text('Programación básica'),
                  ),
                  DropdownMenuItem(
                    value: 'Ofimática',
                    child: Text('Ofimática'),
                  ),
                  DropdownMenuItem(
                    value: 'Inglés',
                    child: Text('Inglés básico'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    basicType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de cursos básicos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  basicQuantityText = value;
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Cursos avanzados:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: advancedType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Diseño',
                    child: Text('Diseño gráfico'),
                  ),
                  DropdownMenuItem(
                    value: 'Marketing',
                    child: Text('Marketing digital'),
                  ),
                  DropdownMenuItem(
                    value: 'Contabilidad',
                    child: Text('Contabilidad'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    advancedType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de cursos avanzados',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  advancedQuantityText = value;
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Especialidades:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: specialtyType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Marketing',
                    child: Text('Marketing avanzado'),
                  ),
                  DropdownMenuItem(
                    value: 'Data Science',
                    child: Text('Data Science'),
                  ),
                  DropdownMenuItem(
                    value: 'Idiomas',
                    child: Text('Idiomas'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    specialtyType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de especialidades',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  specialtyQuantityText = value;
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
      ),
    );
  }
}