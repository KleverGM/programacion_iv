import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoGalleryPage extends StatefulWidget {
  const VideoGalleryPage({super.key});

  @override
  State<VideoGalleryPage> createState() => _VideoGalleryPageState();
}

class _VideoGalleryPageState extends State<VideoGalleryPage> {
  final PageController _pageController = PageController();

  final List<String> _videos = [
    'assets/videos/clase_programacion.mp4',
    'assets/videos/clase_diseno.mp4',
    'assets/videos/clase_marketing.mp4',
  ];
  final List<String> _titles = [
    'Programación',
    'Diseño',
    'Marketing',
  ];

  int _currentIndex = 0;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Simulamos videos placeholder
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = _videos.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de videos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _initialized
                ? PageView.builder(
                    controller: _pageController,
                    itemCount: _videos.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black87,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.video_library,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        _titles[index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _titles[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              iconSize: 40,
                              icon: const Icon(Icons.play_circle),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Agregue ${_videos[index]} en assets/videos/'),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 8),
          Text('Video ${_currentIndex + 1} de $total'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}