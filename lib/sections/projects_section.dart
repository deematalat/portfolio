import 'package:flutter/material.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);
    final columns = AppBreakpoints.isDesktop(width)
        ? 3
        : (AppBreakpoints.isTablet(width) ? 2 : 1);

    return Container(
      color: AppColors.bgAlt,
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.pagePadding(width),
              vertical: isMobile ? 64 : 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScrollReveal(
                child: SectionHeader(
                  eyebrow: 'Projects & Dashboards',
                  title: 'Data that drives decisions',
                  subtitle:
                      'End-to-end analytics work — cleaning, SQL, modelling, and the dashboards built on top.',
                ),
              ),
              const SizedBox(height: 44),
              ResponsiveGrid(
                columns: columns,
                children: [
                  for (int i = 0; i < PortfolioData.projects.length; i++)
                    ScrollReveal(
                      delay: Duration(milliseconds: 80 * i),
                      child: _ProjectCard(project: PortfolioData.projects[i]),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectItem project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient.scale(0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(project.icon, style: const TextStyle(fontSize: 22)),
              ),
              const Spacer(),
              if (project.link != null)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => openUrl(project.link!),
                    child: const Icon(Icons.north_east_rounded,
                        color: AppColors.teal, size: 20),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Text(project.title, style: AppTextStyles.h3.copyWith(fontSize: 18)),
          const SizedBox(height: 6),
          Text(project.tagline,
              style: AppTextStyles.small.copyWith(color: AppColors.teal)),
          const SizedBox(height: 14),
          Text(
            project.description,
            style: AppTextStyles.body.copyWith(fontSize: 14.5),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tools.map((t) => TagChip(t)).toList(),
          ),
        ],
      ),
    );
  }
}

extension GradientOpacity on LinearGradient {
  LinearGradient scale(double opacity) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors.map((c) => c.withValues(alpha: opacity)).toList(),
    );
  }
}
