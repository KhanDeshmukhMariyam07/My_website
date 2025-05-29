import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/background.dart';
import 'package:flutter_portfolio/widgets/profile_image.dart';
import 'package:flutter_portfolio/providers/theme_provider.dart';
import 'package:flutter_portfolio/widgets/project_section.dart';
// import 'package:flutter_portfolio/widgets/responsive_footer.dart'; // <-- Import the footer
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/projects'),
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text('About Me'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact Me'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () => themeProvider.toggleTheme(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60,
                height: 30,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: themeProvider.isDarkMode
                        ? [Colors.black87, Colors.grey.shade800]
                        : [Colors.orange.shade200, Colors.white],
                  ),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: themeProvider.isDarkMode
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: themeProvider.isDarkMode
                      ? const Icon(Icons.nightlight_round, color: Colors.white)
                      : const Icon(Icons.wb_sunny, color: Colors.orange),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const ThemedBackground(), // 🌌 Background layer
          Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;

                    if (width < 600) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            AnimatedProfileImage(size: 150),
                            SizedBox(height: 20),
                            ProfileContent(textSize: 16),
                          ],
                        ),
                      );
                    } else if (width < 1024) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: const [
                            AnimatedProfileImage(size: 200),
                            SizedBox(height: 20),
                            ProfileContent(textSize: 18),
                          ],
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(flex: 2, child: AnimatedProfileImage(size: 250)),
                            SizedBox(width: 50),
                            Expanded(flex: 5, child: ProfileContent(textSize: 18)),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              // ResponsiveFooter(), // 🎯 Footer added at the bottom
            ],
          ),
        ],
      ),
    );
  }
}



class ProfileContent extends StatelessWidget {
  final double textSize;
  const ProfileContent({super.key, required this.textSize});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hi, I\'m ',
              style: TextStyle(fontSize: textSize + 10, fontWeight: FontWeight.bold),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Khan Deshmukh Mariyam',
                  textStyle: TextStyle(
                    fontSize: textSize + 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 500),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
        const SizedBox(height: 50),
        Text(
          'I’m a passionate Flutter developer who loves creating responsive and engaging mobile apps.\n'
          'I focus on clean architecture, pixel-perfect UI, and seamless user experience.',
          style: TextStyle(fontSize: textSize),
        ),
        const SizedBox(height: 15),
        Text(
          '🛠 Skills: Flutter, Dart, Firebase, REST API, Riverpod\n'
          '📘 Learning: Flutter Web, Bloc, Clean Architecture\n'
          '🎯 Goal: Become a Full-stack Mobile App Developer',
          style: TextStyle(fontSize: textSize),
        ),
        const SizedBox(height: 175),
        const ProjectSection(),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 10,
          children: [
            // ElevatedButton.icon(
            //   icon: const Icon(Icons.handshake),
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            //   label: const Text('Cooperation Request', style: TextStyle(color: Colors.white)),
            // ),
            OutlinedButton.icon(
              icon: const Icon(Icons.description),
              label: const Text('Download CV'),
              onPressed: () {
                _launchURL('https://your-cv-link.com');
              },
            ),
            // OutlinedButton.icon(
            //   icon: const Icon(Icons.school),
            //   label: const Text('Courses'),
            //   onPressed: () => Navigator.pushNamed(context, '/courses'),
            // ),
            // OutlinedButton.icon(
            //   icon: const Icon(Icons.folder),
            //   label: const Text('Projects'),
            //   onPressed: () => Navigator.pushNamed(context, '/projects'),
            // ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.code),
              onPressed: () => _launchURL('https://github.com/KhanDeshmukhMariyam07'),
              tooltip: 'GitHub',
            ),
            IconButton(
              icon: const Icon(Icons.alternate_email),
              onPressed: () => _launchURL('mailto:maryamkhandeshmukh@gmail.com'),
              tooltip: 'Email',
            ),
            IconButton(
              icon: const Icon(Icons.work),
              onPressed: () => _launchURL('https://www.linkedin.com/in/maryam-khan-deshmukh'),
              tooltip: 'LinkedIn',
            ),
            // IconButton(
            //   icon: const Icon(Icons.web),
            //   onPressed: () => _launchURL('https://yourwebsite.com'),
            //   tooltip: 'Website',
            // ),
          ],
        ),
      ],
    );
  }
}
