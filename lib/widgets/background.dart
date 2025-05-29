import 'package:flutter/material.dart';
import 'package:flutter_portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemedBackground extends StatelessWidget {
  const ThemedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        // Gradient Background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themeProvider.isDarkMode
                  ? [Colors.black, const Color.fromARGB(255, 104, 102, 102)]
                  : [Colors.orange.shade200, Colors.white,Colors.lightBlue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // Conditional Overlay
        // if (themeProvider.isDarkMode) ...[
          // Stars overlay in dark mode
        //   Positioned.fill(
        //     child: Image.asset(
        //       'assets/stars.jpg',
        //       fit: BoxFit.cover,
        //       opacity: const AlwaysStoppedAnimation(0.5),
        //     ),
        //   ),
        // ] else ...[
          // Sun and clouds in light mode
          // Positioned(
          //   top: 50,
          //   right: 50,
          //   child: Image.asset(
          //     'assets/sun.jpg',
          //     width: 80,
          //   ),
          // ),
          // Positioned(
          //   top: 150,
          //   right: 100,
          //   child: Image.asset(
          //     'assets/cloud.png',
          //     width: 100,
          //   ),
          // ),
        ],
      // ],
    );
  }
}
