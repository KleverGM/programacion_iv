// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:ejemplo_2/main.dart';

void main() {
  testWidgets('App loads home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CursosOnlineApp());

    // Verify that our home page loads
    expect(find.text('Menú Cursos Online'), findsOneWidget);
    expect(find.text('Seleccione una opción:'), findsOneWidget);
    
    // Verify that the main options are present
    expect(find.text('Rendimiento académico'), findsOneWidget);
    expect(find.text('Horas de estudio requeridas'), findsOneWidget);
    expect(find.text('Costo por sesión tutorial'), findsOneWidget);
    expect(find.text('Eficiencia de aprendizaje'), findsOneWidget);
  });
}
