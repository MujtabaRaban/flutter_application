// image_screen.dart

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imagePath;

  const ImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
