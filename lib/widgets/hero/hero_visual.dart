import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/utils/motion.dart';
import '../../data/portfolio_data.dart';

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.86,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.18),
                    AppColors.accent.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.borderStrong),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 28,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      PortfolioData.heroImageAsset,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.15),
                      semanticLabel: '${PortfolioData.name} portrait',
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.background.withValues(alpha: 0.15),
                            AppColors.background.withValues(alpha: 0.82),
                          ],
                          stops: const [0.45, 0.72, 1],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PortfolioData.name,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            PortfolioData.title,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 18,
            right: -4,
            child: _FloatBadge(label: 'Flutter', delay: 0),
          ),
          const Positioned(
            top: 110,
            left: -12,
            child: _FloatBadge(label: 'Dart', delay: 400),
          ),
          const Positioned(
            bottom: 110,
            right: -10,
            child: _FloatBadge(label: 'Firebase', delay: 800),
          ),
        ],
      ),
    );
  }
}

class _FloatBadge extends StatefulWidget {
  const _FloatBadge({required this.label, required this.delay});

  final String label;
  final int delay;

  @override
  State<_FloatBadge> createState() => _FloatBadgeState();
}

class _FloatBadgeState extends State<_FloatBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _startTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    );
    _startTimer = Timer(Duration(milliseconds: widget.delay), () {
      if (!mounted) return;
      if (Motion.reduced(context) || !TickerMode.of(context)) return;
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _startTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduced = Motion.reduced(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final dy = reduced ? 0.0 : (1 - _controller.value) * 6;
        return Transform.translate(offset: Offset(0, dy), child: child);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.borderStrong),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.28),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
