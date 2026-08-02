import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class NavItem {
  final String label;
  final GlobalKey sectionKey;
  const NavItem(this.label, this.sectionKey);
}

class NavBar extends StatefulWidget {
  final List<NavItem> items;
  final void Function(GlobalKey) onNavTap;
  final ScrollController scrollController;
  const NavBar(
      {super.key,
      required this.items,
      required this.onNavTap,
      required this.scrollController});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 20;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = !AppBreakpoints.isDesktop(width);
    final hideBrandText = AppBreakpoints.isMobile(width);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: _scrolled
            ? AppColors.bg.withValues(alpha: 0.75)
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
              color: _scrolled ? AppColors.border : Colors.transparent),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: _scrolled ? 12 : 0, sigmaY: _scrolled ? 12 : 0),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.pagePadding(width), vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    GradientText('DT', style: GoogleFontsHeading.style),
                    const SizedBox(width: 10),
                    if (!hideBrandText)
                      Text('Deema Talat',
                          style: AppTextStyles.h3.copyWith(fontSize: 17)),
                    const Spacer(),
                    if (!isMobile)
                      Row(
                        children: widget.items
                            .map((item) => _NavLink(
                                label: item.label,
                                onTap: () => widget.onNavTap(item.sectionKey)))
                            .toList(),
                      )
                    else
                      GestureDetector(
                        onTap: () => setState(() => _menuOpen = !_menuOpen),
                        child: Icon(_menuOpen ? Icons.close : Icons.menu,
                            color: AppColors.textPrimary),
                      ),
                  ],
                ),
                if (isMobile && _menuOpen)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.items
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: _NavLink(
                                  label: item.label,
                                  onTap: () {
                                    setState(() => _menuOpen = false);
                                    widget.onNavTap(item.sectionKey);
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleFontsHeading {
  static TextStyle get style => AppTextStyles.h3.copyWith(fontSize: 20);
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Text(
            widget.label,
            style: AppTextStyles.button.copyWith(
              fontSize: 14,
              color: _hovering ? AppColors.teal : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
