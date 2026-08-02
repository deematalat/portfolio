import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/scroll_reveal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);
    final isDesktop = AppBreakpoints.isDesktop(width);

    final bio = ScrollReveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
              eyebrow: 'About Me', title: 'The story behind the dashboards'),
          const SizedBox(height: 24),
          Text(PortfolioData.profile, style: AppTextStyles.bodyLarge),
        ],
      ),
    );

    final stats = ScrollReveal(
      delay: const Duration(milliseconds: 150),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: PortfolioData.stats
            .map((s) => _StatCard(value: s.value, label: s.label))
            .toList(),
      ),
    );

    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding(width),
            vertical: isMobile ? 64 : 100),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 6, child: bio),
                  const SizedBox(width: 60),
                  Expanded(flex: 5, child: stats),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bio,
                  const SizedBox(height: 44),
                  stats,
                ],
              ),
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _played = false;

  double? get _numericTarget {
    final digits = RegExp(r'[\d.]+').firstMatch(widget.value);
    return digits != null ? double.tryParse(digits.group(0)!) : null;
  }

  String get _suffix => widget.value.replaceAll(RegExp(r'^[\d.]+'), '');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if (_played) return;
    _played = true;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final target = _numericTarget;
    return VisibilityDetector(
      key: ValueKey('stat-${widget.label}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) _play();
      },
      child: SizedBox(
        width: 190,
        child: GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  final text = target != null
                      ? '${(target * Curves.easeOut.transform(_controller.value)).toStringAsFixed(target % 1 == 0 ? 0 : 1)}$_suffix'
                      : widget.value;
                  return GradientText(text,
                      style: AppTextStyles.h1.copyWith(fontSize: 34));
                },
              ),
              const SizedBox(height: 8),
              Text(widget.label, style: AppTextStyles.small),
            ],
          ),
        ),
      ),
    );
  }
}
