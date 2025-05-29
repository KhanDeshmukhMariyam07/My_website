import 'package:flutter/material.dart';

class ResponsiveFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width to decide layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: isMobile ? _buildColumnLayout() : _buildRowLayout(),
    );
  }

  // Footer layout for larger screens (desktop/tablet)
  Widget _buildRowLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAboutSection(),
        _buildLinksSection(),
        _buildSocialSection(),
      ],
    );
  }

  // Footer layout for mobile (stacked vertically)
  Widget _buildColumnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutSection(),
        SizedBox(height: 16),
        _buildLinksSection(),
        SizedBox(height: 16),
        _buildSocialSection(),
        SizedBox(height: 16),
        _buildCopyright(),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Flutter developer passionate about creating beautiful and responsive apps.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Links',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text('Home', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Portfolio', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Contact', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Follow Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              // IconButton(
              //   icon: const Icon(Icons.twitter, color: Colors.white),
              //   onPressed: () {},
              // ),
              // IconButton(
              //   icon: const Icon(Icons.linkedin, color: Colors.white),
              //   onPressed: () {},
              // ),
            ],
          ),
          _buildCopyright(),
        ],
      ),
    );
  }

  Widget _buildCopyright() {
    return const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'Powered by Flutter'
        '© 2025 Khan Deshmukh. All rights reserved.',
        style: TextStyle(color: Colors.white54, fontSize: 12),
      ),
    );
  }
}
