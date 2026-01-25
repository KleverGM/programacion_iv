import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const CursosOnlineApp());
}

class CursosOnlineApp extends StatelessWidget {
  const CursosOnlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cursos Online - Ejemplo 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}