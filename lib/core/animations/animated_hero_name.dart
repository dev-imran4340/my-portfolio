import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../utils/motion.dart';

/// Large name with a continuous soft float + shimmer accent.
class AnimatedHeroName extends StatefulWidget {
  const AnimatedHeroName({
    super.key,
    required this.name,
    this.fontSize = 56,
  });

  final String name;
  final double fontSize;

  @override
  State<AnimatedHeroName> createState() => _AnimatedHeroNameState();
}

class _AnimatedHeroNameState extends State<AnimatedHeroName>
    with TickerProviderStateMixin {
  late final AnimationController _float;
  late final AnimationController _shimmer;

  @override
  void initState() {
    super.initState();
    _float = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );
    _shimmer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4200),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context) || !TickerMode.of(context)) {
      _float.stop();
      _shimmer.stop();
      return;
    }
    if (!_float.isAnimating) _float.repeat(reverse: true);
    if (!_shimmer.isAnimating) _shimmer.repeat();
  }

  @override
  void deactivate() {
    _float.stop();
    _shimmer.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _float.dispose();
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w700,
          height: 1.05,
          letterSpacing: -1.2,
          color: AppColors.textPrimary,
        );

    if (Motion.reduced(context)) {
      return Text(widget.name, style: baseStyle);
    }

    return AnimatedBuilder(
      animation: Listenable.merge([_float, _shimmer]),
      builder: (context, _) {
        final dy = (1 - _float.value) * 5;
        final t = _shimmer.value;
        return Transform.translate(
          offset: Offset(0, dy),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(-1.2 + t * 2.4, 0),
                end: Alignment(-0.2 + t * 2.4, 0),
                colors: const [
                  AppColors.textPrimary,
                  AppColors.primary,
                  AppColors.accent,
                  AppColors.textPrimary,
                ],
                stops: const [0.0, 0.4, 0.55, 1.0],
              ).createShader(bounds);
            },
            child: Text(widget.name, style: baseStyle),
          ),
        );
      },
    );
  }
}
