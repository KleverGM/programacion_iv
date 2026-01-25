import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromoVideoPage extends StatefulWidget {
  const PromoVideoPage({super.key});

  @override
  State<PromoVideoPage> createState() => _PromoVideoPageState();
}

class _PromoVideoPageState extends State<PromoVideoPage> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Simulamos video placeholder
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video promocional'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _isInitialized
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black87,
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.video_library,
                                size: 80,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Video Promocional',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.play_circle),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Agregue el video promo_curso.mp4 en assets/videos/'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            const Text(
              'Video promocional de nuestros cursos online.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}