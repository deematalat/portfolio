import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}

/// Renders [text] with a brand gradient applied via a ShaderMask.
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  const GradientText(this.text,
      {super.key,
      required this.style,
      this.gradient = AppColors.brandGradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

/// Eyebrow label + heading used at the top of every section.
class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment align;
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(eyebrow.toUpperCase(), style: AppTextStyles.eyebrow),
        const SizedBox(height: 12),
        Text(
          title,
          style: AppTextStyles.h1,
          textAlign: align == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.left,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              style: AppTextStyles.bodyLarge,
              textAlign: align == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.left,
            ),
          ),
        ],
      ],
    );
  }
}

/// A card with a soft border + subtle hover lift, used throughout.
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool hoverEffect;
  const GlassCard(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(28),
      this.hoverEffect = true});

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: (widget.hoverEffect && _hovering)
            ? (Matrix4.identity()..translate(0.0, -6.0, 0.0))
            : Matrix4.identity(),
        clipBehavior: Clip.antiAlias,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: (widget.hoverEffect && _hovering)
                ? AppColors.teal.withValues(alpha: 0.55)
                : AppColors.border,
          ),
          boxShadow: (widget.hoverEffect && _hovering)
              ? [
                  BoxShadow(
                      color: AppColors.teal.withValues(alpha: 0.12),
                      blurRadius: 30,
                      spreadRadius: 2)
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}

enum ButtonStyleKind { primary, secondary }

/// Gradient-filled or outlined pill button with a hover scale.
class AppButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final ButtonStyleKind kind;
  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.icon,
      this.kind = ButtonStyleKind.primary});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isPrimary = widget.kind == ButtonStyleKind.primary;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovering ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              gradient: isPrimary ? AppColors.brandGradient : null,
              color: isPrimary
                  ? null
                  : (_hovering ? AppColors.surfaceAlt : Colors.transparent),
              borderRadius: BorderRadius.circular(100),
              border: isPrimary
                  ? null
                  : Border.all(
                      color: _hovering ? AppColors.teal : AppColors.border),
              boxShadow: isPrimary && _hovering
                  ? [
                      BoxShadow(
                          color: AppColors.teal.withValues(alpha: 0.35),
                          blurRadius: 24,
                          spreadRadius: 1)
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.label,
                    style: AppTextStyles.button.copyWith(
                        color:
                            isPrimary ? AppColors.bg : AppColors.textPrimary)),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(widget.icon,
                      size: 18,
                      color: isPrimary ? AppColors.bg : AppColors.textPrimary),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Small circular icon button used for social links.
class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const SocialIconButton({super.key, required this.icon, required this.onTap});

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovering
                ? AppColors.teal.withValues(alpha: 0.15)
                : AppColors.surface,
            border: Border.all(
                color: _hovering ? AppColors.teal : AppColors.border),
          ),
          child: Icon(widget.icon,
              size: 19,
              color: _hovering ? AppColors.teal : AppColors.textSecondary),
        ),
      ),
    );
  }
}

/// A pill-shaped tag, used for tool/skill chips.
class TagChip extends StatelessWidget {
  final String label;
  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label,
          style: AppTextStyles.small.copyWith(color: AppColors.textSecondary)),
    );
  }
}

/// Lays cards out in [columns] equal-width columns while letting each card
/// size to its own content height. Unlike GridView's fixed mainAxisExtent,
/// this never clips text that wraps to extra lines at narrow widths.
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int columns;
  final double spacing;
  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.columns,
    this.spacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children
              .map((child) => SizedBox(width: itemWidth, child: child))
              .toList(),
        );
      },
    );
  }
}

/// Wraps text with an underline link that opens [url] on tap.
InlineSpan linkSpan(String text, String url, TextStyle style) {
  return TextSpan(
    text: text,
    style: style.copyWith(
        color: AppColors.teal, decoration: TextDecoration.underline),
    recognizer: TapGestureRecognizer()..onTap = () => openUrl(url),
  );
}

/// Max-width centered content container used by every section.
class ContentContainer extends StatelessWidget {
  final Widget child;
  const ContentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: child,
      ),
    );
  }
}
