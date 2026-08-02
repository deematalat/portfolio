import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key});

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
                  eyebrow: 'Insights',
                  title: 'Notes on data & dashboards',
                  subtitle:
                      'Sample layout — replace with real articles when published.',
                ),
              ),
              const SizedBox(height: 40),
              ResponsiveGrid(
                columns: columns,
                children: [
                  for (int i = 0; i < PortfolioData.insights.length; i++)
                    ScrollReveal(
                      delay: Duration(milliseconds: 80 * i),
                      child: GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TagChip(PortfolioData.insights[i].tag),
                            const SizedBox(height: 14),
                            Text(PortfolioData.insights[i].title,
                                style: AppTextStyles.h3.copyWith(fontSize: 16)),
                            const SizedBox(height: 10),
                            Text(PortfolioData.insights[i].excerpt,
                                style:
                                    AppTextStyles.body.copyWith(fontSize: 14)),
                          ],
                        ),
                      ),
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
