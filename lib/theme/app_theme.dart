import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central color palette. Deep-space navy background with a
/// teal -> violet data-viz gradient and an amber highlight accent.
class AppColors {
  AppColors._();

  static const Color bg = Color(0xFF090D16);
  static const Color bgAlt = Color(0xFF0D1220);
  static const Color surface = Color(0xFF121826);
  static const Color surfaceAlt = Color(0xFF161E30);
  static const Color border = Color(0xFF232C42);

  static const Color textPrimary = Color(0xFFF3F6FB);
  static const Color textSecondary = Color(0xFFA7B0C3);
  static const Color textMuted = Color(0xFF6C7690);

  static const Color teal = Color(0xFF19E3C2);
  static const Color violet = Color(0xFF7C5CFF);
  static const Color amber = Color(0xFFFFB020);
  static const Color pink = Color(0xFFFF5C8A);

  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [teal, violet],
  );

  static const LinearGradient warmGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [amber, pink],
  );

  static RadialGradient glowGradient(Color color) => RadialGradient(
        colors: [color.withValues(alpha: 0.35), color.withValues(alpha: 0.0)],
      );
}

/// Breakpoints for responsive layout.
class AppBreakpoints {
  AppBreakpoints._();
  static const double mobile = 640;
  static const double tablet = 1000;
  static const double desktop = 1280;

  static bool isMobile(double w) => w < mobile;
  static bool isTablet(double w) => w >= mobile && w < tablet;
  static bool isDesktop(double w) => w >= tablet;
}

class AppSpacing {
  AppSpacing._();
  static double pagePadding(double width) {
    if (width < AppBreakpoints.mobile) return 20;
    if (width < AppBreakpoints.desktop) return 48;
    return (width - 1180).clamp(24, 400) / 2 + 24;
  }
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get display => GoogleFonts.spaceGrotesk(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.05,
        letterSpacing: -1.5,
      );

  static TextStyle get h1 => GoogleFonts.spaceGrotesk(
        fontSize: 44,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.1,
        letterSpacing: -1,
      );

  static TextStyle get h2 => GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.15,
        letterSpacing: -0.5,
      );

  static TextStyle get h3 => GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get eyebrow => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.teal,
        letterSpacing: 3,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get small => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        height: 1.4,
      );

  static TextStyle get button => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.2,
      );
}

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.teal,
      secondary: AppColors.violet,
      surface: AppColors.surface,
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
}
