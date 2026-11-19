import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageGalleryApp(),
      ),
    );

class ImageGalleryApp extends StatefulWidget {
  const ImageGalleryApp({super.key});

  @override
  State<ImageGalleryApp> createState() => _ImageGalleryAppState();
}

class _ImageGalleryAppState extends State<ImageGalleryApp> {
  
  final List<String> _imagePaths = const [
    'assets/bird.jpg',
    'assets/bird2.jpg',
    'assets/girl.jpg',
    'assets/insect.jpg',
    'assets/man.jpg',
  ];

  int _currentIndex = 0;

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _imagePaths.length) % _imagePaths.length;
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image viewer'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: _previousImage,
            icon: const Icon(Icons.chevron_left),
          ),
          IconButton(
            onPressed: _nextImage,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          _imagePaths[_currentIndex],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}