import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding(width),
            vertical: isMobile ? 64 : 120),
        child: ScrollReveal(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 60, vertical: isMobile ? 40 : 64),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.surface, AppColors.surfaceAlt],
              ),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('LET\'S WORK TOGETHER',
                    style: AppTextStyles.eyebrow, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text(
                  'Have a dataset that needs a story?',
                  style: (isMobile ? AppTextStyles.h2 : AppTextStyles.h1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    'Open to Data Analyst roles, Power BI and dashboard work, and remote '
                    'analytics projects. Reach out any time.',
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 36),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    AppButton(
                      label: PortfolioData.email,
                      icon: Icons.mail_outline_rounded,
                      onTap: () => openUrl('mailto:${PortfolioData.email}'),
                    ),
                    AppButton(
                      label: PortfolioData.phone,
                      icon: Icons.phone_outlined,
                      kind: ButtonStyleKind.secondary,
                      onTap: () => openUrl(
                          'tel:${PortfolioData.phone.replaceAll(' ', '')}'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialIconButton(
                        icon: Icons.link_rounded,
                        onTap: () => openUrl(PortfolioData.linkedinUrl)),
                    const SizedBox(width: 12),
                    SocialIconButton(
                        icon: Icons.code_rounded,
                        onTap: () => openUrl(PortfolioData.githubUrl)),
                    const SizedBox(width: 12),
                    SocialIconButton(
                        icon: Icons.work_outline_rounded,
                        onTap: () => openUrl(PortfolioData.upworkUrl)),
                  ],
                ),
                const SizedBox(height: 20),
                Text(PortfolioData.location, style: AppTextStyles.small),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border))),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.pagePadding(width), vertical: 28),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '© ${DateTime.now().year} ${PortfolioData.name}. Built with Flutter.',
                        style: AppTextStyles.small),
                    const SizedBox(height: 8),
                    Text('Made with intent, from Gaza.',
                        style: AppTextStyles.small),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '© ${DateTime.now().year} ${PortfolioData.name}. Built with Flutter.',
                        style: AppTextStyles.small),
                    Text('Made with intent, from Gaza.',
                        style: AppTextStyles.small),
                  ],
                ),
        ),
      ),
    );
  }
}
