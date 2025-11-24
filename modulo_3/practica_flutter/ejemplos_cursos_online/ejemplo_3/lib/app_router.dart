import 'package:go_router/go_router.dart';

import 'pages/courses_home_page.dart';
import 'pages/course_total_page.dart';
import 'pages/bonus_page.dart';
import 'pages/group_discount_page.dart';
import 'pages/course_packages_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const CoursesHomePage(),
    ),
    GoRoute(
      path: '/total',
      builder: (_, __) => const CourseTotalPage(),
    ),
    GoRoute(
      path: '/bonus',
      builder: (_, __) => const BonusPage(),
    ),
    GoRoute(
      path: '/group',
      builder: (_, __) => const GroupDiscountPage(),
    ),
    GoRoute(
      path: '/packages',
      builder: (_, __) => const CoursePackagesPage(),
    ),
  ],
);