// lib/models/project_data.dart
class ProjectData {
  final String phase;
  final List<String> features;
  final int completedCount;

  ProjectData({
    required this.phase,
    required this.features,
    required this.completedCount,
  });
}
