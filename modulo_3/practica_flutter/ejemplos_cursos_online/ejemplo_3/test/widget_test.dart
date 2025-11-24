// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:ejemplo_3/main.dart';

void main() {
  testWidgets('App loads home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CursosOnlineApp());

    // Verify that our home page loads
    expect(find.text('Menú Cursos Online'), findsOneWidget);
    expect(find.text('Seleccione una opción:'), findsOneWidget);
    
    // Verify that the main options are present
    expect(find.text('Total del curso con impuestos'), findsOneWidget);
    expect(find.text('Calcular bonificación'), findsOneWidget);
    expect(find.text('Descuento grupal'), findsOneWidget);
    expect(find.text('Paquetes de cursos'), findsOneWidget);
  });
}
