import 'package:flutter/material.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/web_iframe.dart';

class DashboardsSection extends StatelessWidget {
  const DashboardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);
    final columns = AppBreakpoints.isDesktop(width) ? 2 : 1;

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
                  eyebrow: 'Live Dashboards',
                  title: 'See the data in action',
                  subtitle:
                      'Live, interactive Power BI reports — explore them directly, or open the full report in a new tab.',
                ),
              ),
              const SizedBox(height: 44),
              ResponsiveGrid(
                columns: columns,
                spacing: 24,
                children: [
                  for (int i = 0; i < PortfolioData.dashboardEmbeds.length; i++)
                    ScrollReveal(
                      delay: Duration(milliseconds: 80 * i),
                      child: _DashboardCard(
                          item: PortfolioData.dashboardEmbeds[i]),
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

class _DashboardCard extends StatelessWidget {
  final DashboardEmbedItem item;
  const _DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverEffect: false,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: AppTextStyles.h3.copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          Text(item.description,
              style: AppTextStyles.body.copyWith(fontSize: 14)),
          const SizedBox(height: 14),
          // Power BI reports are authored 16:10, so match that ratio rather
          // than a fixed height that would letterbox at narrow widths.
          AspectRatio(
            aspectRatio: 16 / 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: AppColors.border)),
                child: WebIframe(url: item.embedUrl),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton(
              label: 'Open Full Report',
              icon: Icons.open_in_new_rounded,
              kind: ButtonStyleKind.secondary,
              onTap: () => openUrl(item.embedUrl),
            ),
          ),
        ],
      ),
    );
  }
}
