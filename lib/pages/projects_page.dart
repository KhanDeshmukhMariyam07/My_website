import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/project_card.dart'; // Your existing project card

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectCard(
        title: "Doctor Appointment App",
        description: "A Flutter app to schedule doctor appointments, manage profiles, and receive reminders.",
        imagePath: "assets/doctor_app.jpg",
        githubLink: "https://github.com/KhanDeshmukhMariyam07/Medical_App",
      ),
      ProjectCard(
        title: "AI in Cybersecurity",
        description: "Exploring how artificial intelligence is applied to enhance security systems.",
        imagePath: "assets/ai_cybersecurity.jpg",
        githubLink: "https://github.com/KhanDeshmukhMariyam07/AI_cybersecurity_flutter_miniProject",
      ),
      ProjectCard(
        title: "DSDSoft (Internship Work)",
        description: "Work done during internship at DSDSoft involving software development tasks.",
        imagePath: "assets/dsdsoft.jpg",
        githubLink: "https://github.com/KhanDeshmukhMariyam07/dsdsoft-project",
      ),
      ProjectCard(
        title: "Frighting (Internship Work)",
        description: "Project work carried out during internship under the Frighting brand.",
        imagePath: "assets/frighting.jpg",
        githubLink: "https://github.com/yourusername/frighting_internship",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final isLeft = index % 2 == 0;
          return _ZigzagTimelineItem(
            child: projects[index],
            isLeft: isLeft,
          );
        },
      ),
    );
  }
}
class _ZigzagTimelineItem extends StatelessWidget {
  final Widget child;
  final bool isLeft;

  const _ZigzagTimelineItem({required this.child, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isLeft) Expanded(child: child),
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
            ],
          ),
        ),
        if (!isLeft) Expanded(child: child),
      ],
    );
  }
}
