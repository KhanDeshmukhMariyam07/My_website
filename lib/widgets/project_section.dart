import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final projects = [
      {
        'title': 'Doctor Appointment App',
        'description':
            'Schedule appointments, manage profiles, and get reminders.',
        'icon': Icons.health_and_safety,
      },
      {
        'title': 'AI in Cybersecurity',
        'description':
            'AI-driven threat detection and smart defense systems.',
        'icon': Icons.shield,
      },
      {
        'title': 'DSDSoft (Internship Work)',
        'description':
            'Worked on real-time data dashboards and admin panels.',
        'icon': Icons.business_center,
      },
      {
        'title': 'Frighting (Internship Work)',
        'description':
            'Assisted in a logistics tracking and freight scheduling system.',
        'icon': Icons.local_shipping,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Projects',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.5,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return _ProjectCard(
              title: project['title'] as String,
              description: project['description'] as String,
              icon: project['icon'] as IconData,
            );
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36, color: Colors.deepPurple),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/projects');
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
