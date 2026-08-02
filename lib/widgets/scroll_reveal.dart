import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades + slides a child into view the first time it becomes visible
/// while scrolling. Reusable across every section for a consistent
/// scroll-triggered animation feel.
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double offsetY;
  final Duration duration;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offsetY = 40,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  bool _played = false;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
            begin: Offset(0, widget.offsetY / 100), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if (_played) return;
    _played = true;
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _key,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.12) _play();
      },
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
