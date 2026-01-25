import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseGalleryPage extends StatefulWidget {
  const CourseGalleryPage({super.key});

  @override
  State<CourseGalleryPage> createState() => _CourseGalleryPageState();
}

class _CourseGalleryPageState extends State<CourseGalleryPage> {
  final PageController _pageController = PageController();
  final List<String> _images = [
    'assets/images/curso1.jpg',
    'assets/images/curso2.jpg',
    'assets/images/curso3.jpg',
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = _images.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de cursos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text('Curso ${_currentIndex + 1} de $total'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}