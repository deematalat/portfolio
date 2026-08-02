class StatItem {
  final String value;
  final String label;
  const StatItem(this.value, this.label);
}

class ExperienceItem {
  final String role;
  final String org;
  final String location;
  final String period;
  final List<String> bullets;
  const ExperienceItem({
    required this.role,
    required this.org,
    required this.location,
    required this.period,
    required this.bullets,
  });
}

class ProjectItem {
  final String title;
  final String tagline;
  final String description;
  final List<String> tools;
  final String? link;
  final String? linkLabel;
  final String icon;
  const ProjectItem({
    required this.title,
    required this.tagline,
    required this.description,
    required this.tools,
    this.link,
    this.linkLabel,
    required this.icon,
  });
}

class SkillCategory {
  final String title;
  final String icon;
  final List<String> skills;
  const SkillCategory(
      {required this.title, required this.icon, required this.skills});
}

class EducationItem {
  final String title;
  final String org;
  final String location;
  final String period;
  final String? detail;
  const EducationItem({
    required this.title,
    required this.org,
    required this.location,
    required this.period,
    this.detail,
  });
}

class InsightItem {
  final String title;
  final String excerpt;
  final String tag;
  const InsightItem(
      {required this.title, required this.excerpt, required this.tag});
}

class DashboardEmbedItem {
  final String title;
  final String description;
  final String embedUrl;
  const DashboardEmbedItem(
      {required this.title, required this.description, required this.embedUrl});
}
