import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/motion.dart';

enum RevealDirection { up, down, left, right, none }

/// Entrance reveal with fade + slide/scale. Different directions for variety.
class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 720),
    this.direction = RevealDirection.up,
    this.distance = 28,
    this.scaleFrom = 1,
    this.awaitVisible = false,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final RevealDirection direction;
  final double distance;
  final double scaleFrom;
  final bool awaitVisible;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;
  late final Animation<double> _scale;
  bool _shown = false;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    final begin = switch (widget.direction) {
      RevealDirection.up => Offset(0, widget.distance / 100),
      RevealDirection.down => Offset(0, -widget.distance / 100),
      RevealDirection.left => Offset(widget.distance / 100, 0),
      RevealDirection.right => Offset(-widget.distance / 100, 0),
      RevealDirection.none => Offset.zero,
    };
    _slide = Tween<Offset>(begin: begin, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _scale = Tween<double>(begin: widget.scaleFrom, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context) && !_shown) {
      _shown = true;
      _controller.value = 1;
      return;
    }
    if (!widget.awaitVisible && !_shown) {
      _kickoff();
    }
  }

  void _kickoff() {
    if (_shown) return;
    _shown = true;
    if (widget.delay > Duration.zero && !Motion.reduced(context)) {
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
      return;
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: ScaleTransition(scale: _scale, child: widget.child),
      ),
    );

    if (!widget.awaitVisible) return content;

    return VisibilityDetector(
      key: Key('reveal-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.12) _kickoff();
      },
      child: content,
    );
  }
}
