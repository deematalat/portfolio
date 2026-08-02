import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/dashboards_section.dart';
import 'sections/education_section.dart';
import 'sections/insights_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deema Talat — Data Analyst & Power BI Developer',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _dashboardsKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<NavItem> _navItems = [
    NavItem('Home', _heroKey),
    NavItem('About', _aboutKey),
    NavItem('Skills', _skillsKey),
    NavItem('Experience', _experienceKey),
    NavItem('Projects', _projectsKey),
    NavItem('Dashboards', _dashboardsKey),
    NavItem('Education', _educationKey),
    NavItem('Contact', _contactKey),
  ];

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 90),
                Container(
                    key: _heroKey,
                    child: HeroSection(
                      onViewProjects: () => _scrollTo(_projectsKey),
                      onContact: () => _scrollTo(_contactKey),
                    )),
                Container(key: _aboutKey, child: const AboutSection()),
                Container(key: _skillsKey, child: const SkillsSection()),
                Container(
                    key: _experienceKey, child: const ExperienceSection()),
                Container(key: _projectsKey, child: const ProjectsSection()),
                Container(
                    key: _dashboardsKey, child: const DashboardsSection()),
                Container(key: _educationKey, child: const EducationSection()),
                const InsightsSection(),
                Container(key: _contactKey, child: const ContactSection()),
                const SiteFooter(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              items: _navItems,
              onNavTap: _scrollTo,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
