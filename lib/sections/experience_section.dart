import 'package:flutter/material.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

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
                eyebrow: 'Experience',
                title: 'Engineering behind the analysis',
                subtitle:
                    'Two years building production systems and data models, alongside independent client delivery.',
              ),
            ),
            const SizedBox(height: 48),
            for (int i = 0; i < PortfolioData.experience.length; i++)
              ScrollReveal(
                delay: Duration(milliseconds: 100 * i),
                child: _TimelineTile(
                  item: PortfolioData.experience[i],
                  isLast: i == PortfolioData.experience.length - 1,
                  isMobile: isMobile,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final ExperienceItem item;
  final bool isLast;
  final bool isMobile;
  const _TimelineTile(
      {required this.item, required this.isLast, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 7,
            top: 28,
            bottom: 40,
            child: Container(width: 2, color: AppColors.border),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.brandGradient,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.teal.withValues(alpha: 0.4),
                      blurRadius: 12)
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: GlassCard(
                  hoverEffect: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          Text(item.role, style: AppTextStyles.h3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.teal.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(item.period,
                                style: AppTextStyles.small
                                    .copyWith(color: AppColors.teal)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('${item.org} · ${item.location}',
                          style: AppTextStyles.body
                              .copyWith(color: AppColors.textMuted)),
                      const SizedBox(height: 16),
                      ...item.bullets.map(
                        (b) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Icon(Icons.circle,
                                    size: 5, color: AppColors.violet),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(b, style: AppTextStyles.body)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
