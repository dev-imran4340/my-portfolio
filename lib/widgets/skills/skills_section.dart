import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/reveal.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(
            awaitVisible: true,
            direction: RevealDirection.left,
            child: SectionHeader(
              eyebrow: 'Skills',
              title: 'Tools I Build With',
              subtitle:
                  'A focused stack for shipping maintainable Flutter apps — not a laundry list.',
            ),
          ),
          const SizedBox(height: 40),
          const _SkillsShowcase(),
        ],
      ),
    );
  }
}

class _SkillsShowcase extends StatefulWidget {
  const _SkillsShowcase();

  @override
  State<_SkillsShowcase> createState() => _SkillsShowcaseState();
}

class _SkillsShowcaseState extends State<_SkillsShowcase> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    final categories = PortfolioData.skillCategories;
    final selected = categories[_active];
    final stacked = context.isCompact;

    if (stacked) {
      return Column(
        children: [
          for (var i = 0; i < categories.length; i++) ...[
            Reveal(
              awaitVisible: true,
              delay: Duration(milliseconds: 80 * i),
              direction: RevealDirection.up,
              child: _CategoryPanel(
                category: categories[i],
                index: i,
                expanded: true,
              ),
            ),
            if (i != categories.length - 1) const SizedBox(height: 14),
          ],
        ],
      );
    }

    return Reveal(
      awaitVisible: true,
      direction: RevealDirection.up,
      child: Container(
        constraints: const BoxConstraints(minHeight: 340),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 240,
              child: ColoredBox(color: AppColors.secondaryBackground),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var index = 0; index < categories.length; index++)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: index == categories.length - 1 ? 0 : 6,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => setState(() => _active = index),
                              child: AnimatedContainer(
                                duration: Motion.of(
                                  context,
                                  const Duration(milliseconds: 180),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: index == _active
                                      ? AppColors.primary.withValues(alpha: 0.14)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: index == _active
                                        ? AppColors.primary
                                            .withValues(alpha: 0.35)
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: Motion.of(
                                        context,
                                        const Duration(milliseconds: 180),
                                      ),
                                      width: 4,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: index == _active
                                            ? AppColors.primary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        categories[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              color: index == _active
                                                  ? AppColors.textPrimary
                                                  : AppColors.textSecondary,
                                              fontWeight: index == _active
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
                    child: AnimatedSwitcher(
                      duration: Motion.of(
                        context,
                        const Duration(milliseconds: 280),
                      ),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: _CategoryDetail(
                        key: ValueKey(selected.title),
                        category: selected,
                        index: _active,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryPanel extends StatelessWidget {
  const _CategoryPanel({
    required this.category,
    required this.index,
    required this.expanded,
  });

  final SkillCategory category;
  final int index;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: _CategoryDetail(category: category, index: index),
    );
  }
}

class _CategoryDetail extends StatelessWidget {
  const _CategoryDetail({
    super.key,
    required this.category,
    required this.index,
  });

  final SkillCategory category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${(index + 1).toString().padLeft(2, '0')}  /  ${PortfolioData.skillCategories.length.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primary,
                letterSpacing: 1.6,
                fontSize: 12,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          category.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 26,
              ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final item in category.items) _SkillTile(item: item),
          ],
        ),
      ],
    );
  }
}

class _SkillTile extends StatefulWidget {
  const _SkillTile({required this.item});

  final SkillItem item;

  @override
  State<_SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<_SkillTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: Motion.of(context, const Duration(milliseconds: 160)),
        transform: Matrix4.translationValues(0, _hover ? -2 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: _hover ? AppColors.primarySoft : AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hover
                ? AppColors.primary.withValues(alpha: 0.4)
                : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.item.icon,
              size: 16,
              color: _hover ? AppColors.primary : AppColors.accent,
            ),
            const SizedBox(width: 10),
            Text(
              widget.item.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
