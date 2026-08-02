import 'package:flutter/material.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                  eyebrow: 'Skills',
                  title: 'Tools of the trade',
                  subtitle:
                      'The stack I use across the analytics pipeline — from raw extract to published dashboard.',
                ),
              ),
              const SizedBox(height: 44),
              ResponsiveGrid(
                columns: columns,
                children: [
                  for (int i = 0; i < PortfolioData.skillCategories.length; i++)
                    ScrollReveal(
                      delay: Duration(milliseconds: 80 * i),
                      child: _SkillCard(
                          category: PortfolioData.skillCategories[i]),
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

class _SkillCard extends StatelessWidget {
  final SkillCategory category;
  const _SkillCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(category.icon, style: const TextStyle(fontSize: 26)),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(category.title,
                      style: AppTextStyles.h3.copyWith(fontSize: 18))),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((s) => TagChip(s)).toList(),
          ),
        ],
      ),
    );
  }
}
