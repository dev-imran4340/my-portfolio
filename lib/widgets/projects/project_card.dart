import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/motion.dart';
import '../../models/portfolio_models.dart';
import '../common/app_button.dart';
import 'device_mockup.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.imageFirst = true,
  });

  final Project project;
  final bool imageFirst;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final stacked = context.isCompact;
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: AspectRatio(
        aspectRatio: widget.project.screenshotAsset != null
            ? (stacked ? 1.7 : 1.85)
            : (stacked ? 1.35 : 1.15),
        child: ProjectVisual(project: widget.project, zoom: _hover),
      ),
    );

    final copy = _ProjectCopy(
      project: widget.project,
      hovered: _hover,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: Motion.of(context, const Duration(milliseconds: 220)),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hover
                ? widget.project.accent.withValues(alpha: 0.45)
                : AppColors.border,
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: widget.project.accent.withValues(alpha: 0.12),
                    blurRadius: 28,
                    offset: const Offset(0, 16),
                  ),
                ]
              : null,
        ),
        child: stacked
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [image, const SizedBox(height: 18), copy],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.imageFirst
                    ? [
                        Expanded(child: image),
                        const SizedBox(width: 28),
                        Expanded(child: copy),
                      ]
                    : [
                        Expanded(child: copy),
                        const SizedBox(width: 28),
                        Expanded(child: image),
                      ],
              ),
      ),
    );
  }
}

class _ProjectCopy extends StatelessWidget {
  const _ProjectCopy({
    required this.project,
    required this.hovered,
  });

  final Project project;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.category.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1.6,
                  fontSize: 11,
                ),
          ),
          const SizedBox(height: 10),
          Text(project.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(project.summary, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tech in project.technologies)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    tech,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 22),
          AppButton(
            label: 'View Case Study',
            icon: hovered ? Icons.arrow_outward : Icons.arrow_forward,
            onPressed: () => context.go('/work/${project.slug}'),
          ),
        ],
      ),
    );
  }
}
