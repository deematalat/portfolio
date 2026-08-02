import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;
  const HeroSection(
      {super.key, required this.onViewProjects, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    return Stack(
      children: [
        Positioned(
          top: -120,
          right: isMobile ? -140 : -60,
          child: _Glow(color: AppColors.teal, size: isMobile ? 280 : 420),
        ),
        Positioned(
          bottom: -160,
          left: isMobile ? -160 : -40,
          child: _Glow(color: AppColors.violet, size: isMobile ? 300 : 460),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding(width)),
          child: ContentContainer(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    isMobile ? 0 : MediaQuery.of(context).size.height * 0.86,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 110 : 40),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.surface,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: AppColors.teal,
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            Text('Available for new opportunities',
                                style: AppTextStyles.small
                                    .copyWith(color: AppColors.textSecondary)),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 28),
                      Text(
                        'Hi, I\'m',
                        style: AppTextStyles.h2.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w400),
                      )
                          .animate()
                          .fadeIn(delay: 150.ms, duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 6),
                      GradientText(
                        PortfolioData.name,
                        style: (isMobile
                            ? AppTextStyles.h1
                            : AppTextStyles.display),
                      )
                          .animate()
                          .fadeIn(delay: 250.ms, duration: 600.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 18),
                      Text(
                        PortfolioData.title,
                        style: AppTextStyles.h3.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500),
                      )
                          .animate()
                          .fadeIn(delay: 380.ms, duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: Text(PortfolioData.heroTagline,
                            style: AppTextStyles.bodyLarge),
                      )
                          .animate()
                          .fadeIn(delay: 480.ms, duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 36),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          AppButton(
                              label: 'View Projects',
                              icon: Icons.arrow_forward_rounded,
                              onTap: onViewProjects),
                          AppButton(
                              label: 'Get in Touch',
                              kind: ButtonStyleKind.secondary,
                              onTap: onContact),
                        ],
                      )
                          .animate()
                          .fadeIn(delay: 600.ms, duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SocialIconButton(
                              icon: Icons.mail_outline_rounded,
                              onTap: () =>
                                  openUrl('mailto:${PortfolioData.email}')),
                          const SizedBox(width: 12),
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
                      ).animate().fadeIn(delay: 720.ms, duration: 500.ms),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  final double size;
  const _Glow({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, gradient: AppColors.glowGradient(color)),
      ).animate(onPlay: (c) => c.repeat(reverse: true)).scaleXY(
          begin: 1, end: 1.08, duration: 4000.ms, curve: Curves.easeInOut),
    );
  }
}
