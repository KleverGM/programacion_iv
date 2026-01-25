import 'package:go_router/go_router.dart';

import 'pages/courses_home_page.dart';
import 'pages/course_plan_page.dart';
import 'pages/featured_course_page.dart';
import 'pages/promo_video_page.dart';
import 'pages/course_gallery_page.dart';
import 'pages/video_gallery_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CoursesHomePage(),
    ),
    GoRoute(
      path: '/plan',
      builder: (context, state) => const CoursePlanPage(),
    ),
    GoRoute(
      path: '/featured',
      builder: (context, state) => const FeaturedCoursePage(),
    ),
    GoRoute(
      path: '/promo-video',
      builder: (context, state) => const PromoVideoPage(),
    ),
    GoRoute(
      path: '/gallery',
      builder: (context, state) => const CourseGalleryPage(),
    ),
    GoRoute(
      path: '/videos',
      builder: (context, state) => const VideoGalleryPage(),
    ),
  ],
);