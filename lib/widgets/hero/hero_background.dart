import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/utils/motion.dart';

class HeroBackground extends StatefulWidget {
  const HeroBackground({super.key});

  @override
  State<HeroBackground> createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context) || !TickerMode.of(context)) {
      _controller.stop();
      return;
    }
    if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void deactivate() {
    _controller.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduced = Motion.reduced(context);
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _HeroPainter(
              progress: reduced ? 0 : _controller.value,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _HeroPainter extends CustomPainter {
  _HeroPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = Colors.white.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    const step = 56.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final glow = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.primary.withValues(alpha: 0.16),
          AppColors.accent.withValues(alpha: 0.04),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * 0.78, size.height * 0.38),
          radius: size.width * 0.38,
        ),
      );
    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.38),
      size.width * 0.38,
      glow,
    );

    final dots = Paint()..color = AppColors.accent.withValues(alpha: 0.35);
    const count = 18;
    for (var i = 0; i < count; i++) {
      final t = (progress + i / count) % 1;
      final x = size.width * (0.08 + (i * 47 % 84) / 100);
      final y = size.height * (0.12 + (math.sin((t + i) * math.pi * 2) + 1) / 5);
      canvas.drawCircle(Offset(x, y), i.isEven ? 1.6 : 1.1, dots);
    }
  }

  @override
  bool shouldRepaint(covariant _HeroPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
