import 'package:flutter/material.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);
    final isDesktop = AppBreakpoints.isDesktop(width);

    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding(width),
            vertical: isMobile ? 64 : 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScrollReveal(
              child: SectionHeader(
                eyebrow: 'Credentials',
                title: 'Education & training',
              ),
            ),
            const SizedBox(height: 44),
            ResponsiveGrid(
              columns: isDesktop ? 2 : 1,
              children: [
                for (int i = 0; i < PortfolioData.education.length; i++)
                  ScrollReveal(
                    delay: Duration(milliseconds: 80 * i),
                    child: _EducationCard(item: PortfolioData.education[i]),
                  ),
              ],
            ),
            const SizedBox(height: 40),
            ScrollReveal(
              child: Text('Training & Certifications',
                  style: AppTextStyles.h3.copyWith(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ResponsiveGrid(
              columns: isDesktop ? 2 : 1,
              children: [
                for (int i = 0; i < PortfolioData.certifications.length; i++)
                  ScrollReveal(
                    delay: Duration(milliseconds: 60 * i),
                    child:
                        _EducationCard(item: PortfolioData.certifications[i]),
                  ),
              ],
            ),
            const SizedBox(height: 40),
            ScrollReveal(
              child: Text('Languages',
                  style: AppTextStyles.h3.copyWith(fontSize: 18)),
            ),
            const SizedBox(height: 14),
            ScrollReveal(
              delay: const Duration(milliseconds: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final l in PortfolioData.languages)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(Icons.language_rounded,
                                size: 16, color: AppColors.violet),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Text(l, style: AppTextStyles.body)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final EducationItem item;
  const _EducationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverEffect: false,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: AppTextStyles.h3.copyWith(fontSize: 16)),
          const SizedBox(height: 6),
          Text(
            item.location.isEmpty ? item.org : '${item.org} · ${item.location}',
            style: AppTextStyles.small,
          ),
          const SizedBox(height: 4),
          Text(item.period,
              style: AppTextStyles.small.copyWith(color: AppColors.teal)),
          if (item.detail != null) ...[
            const SizedBox(height: 10),
            Text(item.detail!,
                style: AppTextStyles.body.copyWith(fontSize: 14)),
          ],
        ],
      ),
    );
  }
}
