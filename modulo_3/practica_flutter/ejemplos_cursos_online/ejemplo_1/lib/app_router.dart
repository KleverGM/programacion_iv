import 'package:go_router/go_router.dart';

import 'pages/courses_home_page.dart';
import 'pages/enrollment_calculator_page.dart';
import 'pages/progress_tracker_page.dart';
import 'pages/certification_fee_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CoursesHomePage(),
    ),
    GoRoute(
      path: '/enrollment',
      builder: (context, state) => const EnrollmentCalculatorPage(),
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressTrackerPage(),
    ),
    GoRoute(
      path: '/certification',
      builder: (context, state) => const CertificationFeePage(),
    ),
  ],
);