
// Importa el paquete go_router para gestionar la navegación entre páginas.
import 'package:go_router/go_router.dart';

// Importa las páginas que serán usadas en las rutas.
import 'pages/admissions_home_page.dart';
import 'pages/average_grade_page.dart';
import 'pages/tuition_page.dart';
import 'pages/enrollment_fee_page.dart';
import 'pages/credits_summary_page.dart';
import 'pages/restaurante.dart';

// Configuración del router principal de la app.
// Define las rutas y qué página se muestra en cada una.
final GoRouter appRouter = GoRouter(
  routes: [
    // Ruta principal (menú de admisiones)
    GoRoute(
      path: '/',
      builder: (_, __) => const AdmissionsHomePage(),
    ),
    // Ruta para la página de promedio de notas
    GoRoute(
      path: '/average',
      builder: (_, __) => const AverageGradePage(),
    ),
    // Ruta para la página de cálculo de matrícula
    GoRoute(
      path: '/tuition',
      builder: (_, __) => const TuitionPage(),
    ),
    // Ruta para la página de derechos de inscripción
    GoRoute(
      path: '/fees',
      builder: (_, __) => const EnrollmentFeePage(),
    ),
    // Ruta para la página de sumatoria de créditos
    GoRoute(
      path: '/credits',
      builder: (_, __) => const CreditsSummaryPage(),
    ),
    // Ruta para la calculadora de propinas del restaurante
    GoRoute(
      path: '/restaurante',
      builder: (_, __) => const RestaurantePage(),
    ),
  ],
);
