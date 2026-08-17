import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
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
      child: FadeSlideIn(
        child: stacked
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _AboutCopy(),
                  SizedBox(height: 28),
                  _AboutStats(),
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 6, child: _AboutCopy()),
                  SizedBox(width: 48),
                  Expanded(flex: 5, child: _AboutStats()),
                ],
              ),
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
        const SectionHeader(
          eyebrow: 'About',
          title: PortfolioData.aboutHeading,
        ),
        const SizedBox(height: 24),
        for (var i = 0; i < PortfolioData.aboutParagraphs.length; i++) ...[
          Text(
            PortfolioData.aboutParagraphs[i],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (i != PortfolioData.aboutParagraphs.length - 1)
            const SizedBox(height: 16),
        ],
        const SizedBox(height: 28),
        Text(
          'Education',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        for (final entry in PortfolioData.education)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(14),
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
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: context.screenWidth < 480 ? 2.6 : 1.35,
      ),
      itemBuilder: (context, index) {
        final item = PortfolioData.aboutHighlights[index];
        return Container(
          padding: const EdgeInsets.all(20),
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
        );
      },
    );
  }
}
