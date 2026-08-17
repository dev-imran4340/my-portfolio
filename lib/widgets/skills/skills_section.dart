import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/motion.dart';
import '../../data/portfolio_data.dart';
import '../../models/portfolio_models.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      sectionKey: sectionKey,
      semanticLabel: 'Tech stack',
      child: FadeSlideIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: 'Capabilities',
              title: 'Tech Stack',
              subtitle:
                  'Tools and patterns I use to ship maintainable production apps.',
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 1100
                    ? 3
                    : constraints.maxWidth >= 720
                        ? 2
                        : 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: PortfolioData.skillCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: context.isMobile ? 252 : 236,
                  ),
                  itemBuilder: (context, index) {
                    return _SkillCard(
                      category: PortfolioData.skillCategories[index],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.category});

  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in category.items) _SkillChip(item: item),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  const _SkillChip({required this.item});

  final SkillItem item;

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: Motion.of(context, const Duration(milliseconds: 160)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: _hover ? AppColors.primarySoft : AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hover ? AppColors.primary.withValues(alpha: 0.45) : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.item.icon,
              size: 14,
              color: _hover ? AppColors.primary : AppColors.accent,
            ),
            const SizedBox(width: 8),
            Text(
              widget.item.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
