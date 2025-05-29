import 'package:flutter/material.dart';

class AnimatedProfileImage extends StatefulWidget {
  const AnimatedProfileImage({super.key, required int size});

  @override
  State<AnimatedProfileImage> createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<AnimatedProfileImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(
          'assets/profile.jpg',
          width: 250,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}