import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CertificationFeePage extends StatefulWidget {
  const CertificationFeePage({super.key});

  @override
  State<CertificationFeePage> createState() => _CertificationFeePageState();
}

class _CertificationFeePageState extends State<CertificationFeePage> {
  String certificationType = 'Digital básico';
  String courseValueText = '';
  String resultText = '';

  void calculateCertificationFee() {
    final courseValue = double.tryParse(courseValueText.replaceAll(',', '.')) ?? 0.0;

    if (courseValue <= 0) {
      setState(() {
        resultText = 'Ingrese un valor válido del curso';
      });
      return;
    }

    double feePercentage = 0.0;
    double baseFee = 0.0;

    if (certificationType == 'Digital básico') {
      feePercentage = 5.0; // 5% del valor del curso
      baseFee = 10.0; // $10 base
    } else if (certificationType == 'Digital premium') {
      feePercentage = 8.0; // 8% del valor del curso
      baseFee = 25.0; // $25 base
    } else if (certificationType == 'Físico nacional') {
      feePercentage = 10.0; // 10% del valor del curso
      baseFee = 50.0; // $50 base (incluye envío)
    } else if (certificationType == 'Físico internacional') {
      feePercentage = 15.0; // 15% del valor del curso
      baseFee = 100.0; // $100 base (incluye envío internacional)
    }

    final variableFee = courseValue * feePercentage / 100;
    final totalFee = baseFee + variableFee;
    final processingTime = _getProcessingTime();

    setState(() {
      resultText =
        'Tipo de certificación: $certificationType\n'
        'Tarifa base: \$${baseFee.toStringAsFixed(2)}\n'
        'Tarifa variable (${feePercentage.toStringAsFixed(1)}%): \$${variableFee.toStringAsFixed(2)}\n'
        'Costo total: \$${totalFee.toStringAsFixed(2)}\n'
        'Tiempo de procesamiento: $processingTime';
    });
  }

  String _getProcessingTime() {
    switch (certificationType) {
      case 'Digital básico':
        return '1-2 días hábiles';
      case 'Digital premium':
        return '3-5 días hábiles';
      case 'Físico nacional':
        return '7-10 días hábiles';
      case 'Físico internacional':
        return '15-21 días hábiles';
      default:
        return 'No especificado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de certificación'),
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
              'Cálculo de costo de certificado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: certificationType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Digital básico',
                  child: Text('Certificado digital básico'),
                ),
                DropdownMenuItem(
                  value: 'Digital premium',
                  child: Text('Certificado digital premium'),
                ),
                DropdownMenuItem(
                  value: 'Físico nacional',
                  child: Text('Certificado físico nacional'),
                ),
                DropdownMenuItem(
                  value: 'Físico internacional',
                  child: Text('Certificado físico internacional'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  certificationType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor del curso (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                courseValueText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateCertificationFee,
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