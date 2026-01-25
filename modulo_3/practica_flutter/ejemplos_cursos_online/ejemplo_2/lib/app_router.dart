import 'package:go_router/go_router.dart';

import 'pages/courses_home_page.dart';
import 'pages/study_performance_page.dart';
import 'pages/study_hours_page.dart';
import 'pages/course_cost_page.dart';
import 'pages/learning_efficiency_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const CoursesHomePage(),
    ),
    GoRoute(
      path: '/performance',
      builder: (_, __) => const StudyPerformancePage(),
    ),
    GoRoute(
      path: '/hours',
      builder: (_, __) => const StudyHoursPage(),
    ),
    GoRoute(
      path: '/cost',
      builder: (_, __) => const CourseCostPage(),
    ),
    GoRoute(
      path: '/efficiency',
      builder: (_, __) => const LearningEfficiencyPage(),
    ),
  ],
);