import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../models/portfolio_models.dart';

class ProjectVisual extends StatelessWidget {
  const ProjectVisual({
    super.key,
    required this.project,
    this.zoom = false,
  });

  final Project project;
  final bool zoom;

  @override
  Widget build(BuildContext context) {
    final child = project.screenshotAsset == null
        ? _StylizedPreview(project: project)
        : ColoredBox(
            color: AppColors.secondaryBackground,
            child: Image.asset(
              project.screenshotAsset!,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              semanticLabel: '${project.name} project showcase',
            ),
          );

    return AnimatedScale(
      scale: zoom ? 1.03 : 1,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
      child: child,
    );
  }
}

class _StylizedPreview extends StatelessWidget {
  const _StylizedPreview({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.secondaryBackground,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  project.accent.withValues(alpha: 0.22),
                  Colors.transparent,
                  AppColors.primary.withValues(alpha: 0.08),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'APP PREVIEW',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        letterSpacing: 1.8,
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  project.category,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        _bar(0.72),
                        const SizedBox(height: 10),
                        _bar(0.48, color: project.accent.withValues(alpha: 0.55)),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: _panel(project.accent)),
                              const SizedBox(width: 10),
                              Expanded(child: _panel(AppColors.accent)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '[PROJECT_SCREENSHOT]',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textMuted,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar(double widthFactor, {Color? color}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          height: 10,
          decoration: BoxDecoration(
            color: color ?? Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }

  Widget _panel(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
    );
  }
}
