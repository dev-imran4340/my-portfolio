import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/motion.dart';

class FadeSlideIn extends StatefulWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = 22,
  });

  final Widget child;
  final Duration delay;
  final double offset;

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;
  bool _shown = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offset / 120),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context) && !_shown) {
      _shown = true;
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _reveal() async {
    if (_shown) return;
    _shown = true;
    if (widget.delay > Duration.zero && !Motion.reduced(context)) {
      await Future<void>.delayed(widget.delay);
      if (!mounted) return;
    }
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('fade-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.12) {
          _reveal();
        }
      },
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
