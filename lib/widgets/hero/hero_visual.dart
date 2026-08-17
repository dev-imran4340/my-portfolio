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
      aspectRatio: 0.92,
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
                    AppColors.primary.withValues(alpha: 0.16),
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
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.borderStrong),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      _WindowDot(color: Color(0xFFFF6B6B)),
                      SizedBox(width: 6),
                      _WindowDot(color: Color(0xFFFFD166)),
                      SizedBox(width: 6),
                      _WindowDot(color: Color(0xFF3DDC84)),
                      SizedBox(width: 12),
                      Text(
                        'main.dart',
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Expanded(child: _CodePreview()),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          PortfolioData.shortName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PortfolioData.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              PortfolioData.title,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textMuted,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: -8,
            right: -6,
            child: _FloatBadge(label: 'Flutter', delay: 0),
          ),
          const Positioned(
            top: 86,
            left: -18,
            child: _FloatBadge(label: 'Dart', delay: 400),
          ),
          const Positioned(
            bottom: 92,
            right: -16,
            child: _FloatBadge(label: 'Firebase', delay: 800),
          ),
          const Positioned(
            bottom: 18,
            left: -10,
            child: _FloatBadge(label: 'GetX', delay: 1200),
          ),
        ],
      ),
    );
  }
}

class _WindowDot extends StatelessWidget {
  const _WindowDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _CodePreview extends StatelessWidget {
  const _CodePreview();

  @override
  Widget build(BuildContext context) {
    const lines = [
      (_cPurple, 'class ', _cWhite, 'ProductApp ', _cMuted, 'extends StatelessWidget {'),
      (_cMuted, '  const ProductApp();', _cEmpty, '', _cEmpty, ''),
      (_cPurple, '  Widget ', _cBlue, 'build', _cMuted, '(context) {'),
      (_cPurple, '    return ', _cBlue, 'MaterialApp', _cMuted, '('),
      (_cMuted, '      title: ', _cGreen, "'SBS Accounting'", _cMuted, ','),
      (_cMuted, '      home: ', _cBlue, 'DashboardView', _cMuted, '(),'),
      (_cMuted, '    );', _cEmpty, '', _cEmpty, ''),
      (_cMuted, '  }', _cEmpty, '', _cEmpty, ''),
    ];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < lines.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${(i + 1).toString().padLeft(2)}  ',
                      style: const TextStyle(color: AppColors.textMuted),
                    ),
                    TextSpan(text: lines[i].$1 == _cEmpty ? '' : '', style: TextStyle(color: lines[i].$1)),
                    TextSpan(text: lines[i].$2, style: TextStyle(color: lines[i].$1)),
                    TextSpan(text: lines[i].$4, style: TextStyle(color: lines[i].$3)),
                    TextSpan(text: lines[i].$6, style: TextStyle(color: lines[i].$5)),
                  ],
                ),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.5,
                  height: 1.45,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

const _cPurple = Color(0xFFB39DDB);
const _cBlue = Color(0xFF80CBC4);
const _cGreen = Color(0xFFAED581);
const _cWhite = Color(0xFFE8EAF0);
const _cMuted = Color(0xFF7B8494);
const _cEmpty = Colors.transparent;

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
          color: AppColors.secondaryBackground,
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
