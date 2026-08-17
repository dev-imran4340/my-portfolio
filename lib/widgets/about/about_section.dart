import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/reveal.dart';
import '../../core/responsive/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final stacked = context.isCompact;

    return SectionScaffold(
      sectionKey: sectionKey,
      background: AppColors.secondaryBackground,
      semanticLabel: 'About',
      child: stacked
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AboutCopy(),
                SizedBox(height: 36),
                _AboutStats(),
              ],
            )
          : const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _AboutCopy()),
                SizedBox(width: 56),
                Expanded(flex: 5, child: _AboutStats()),
              ],
            ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  const _AboutCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Reveal(
          awaitVisible: true,
          direction: RevealDirection.left,
          child: SectionHeader(
            eyebrow: 'About Me',
            title: PortfolioData.aboutHeading,
          ),
        ),
        const SizedBox(height: 28),
        for (var i = 0; i < PortfolioData.aboutParagraphs.length; i++) ...[
          Reveal(
            awaitVisible: true,
            delay: Duration(milliseconds: 160 + (i * 180)),
            direction:
                i.isEven ? RevealDirection.up : RevealDirection.right,
            child: Text(
              PortfolioData.aboutParagraphs[i],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.75,
                    fontSize: 16,
                  ),
            ),
          ),
          if (i != PortfolioData.aboutParagraphs.length - 1)
            const SizedBox(height: 20),
        ],
        const SizedBox(height: 36),
        Reveal(
          awaitVisible: true,
          delay: const Duration(milliseconds: 700),
          direction: RevealDirection.up,
          child: Text(
            'Education',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 14),
        for (final entry in PortfolioData.education)
          Reveal(
            awaitVisible: true,
            delay: const Duration(milliseconds: 820),
            direction: RevealDirection.up,
            scaleFrom: 0.97,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.degree,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${entry.institution} · ${entry.period}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  for (final detail in entry.details)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '• $detail',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _AboutStats extends StatelessWidget {
  const _AboutStats();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PortfolioData.aboutHighlights.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.screenWidth < 480 ? 1 : 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: context.screenWidth < 480 ? 2.6 : 1.35,
      ),
      itemBuilder: (context, index) {
        final item = PortfolioData.aboutHighlights[index];
        return Reveal(
          awaitVisible: true,
          delay: Duration(milliseconds: 200 + (index * 140)),
          direction: index.isEven ? RevealDirection.right : RevealDirection.up,
          scaleFrom: 0.94,
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primary,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
