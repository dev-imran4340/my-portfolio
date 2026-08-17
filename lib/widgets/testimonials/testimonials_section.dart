import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
import '../../data/portfolio_data.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      sectionKey: sectionKey,
      semanticLabel: 'Testimonials',
      child: FadeSlideIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: 'References',
              title: 'Testimonials',
              subtitle:
                  'Placeholder quotes for replacement. These are not real testimonials.',
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
                  itemCount: PortfolioData.testimonials.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 260,
                  ),
                  itemBuilder: (context, index) {
                    final item = PortfolioData.testimonials[index];
                    return Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primarySoft,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'PLACEHOLDER',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: 10,
                                    letterSpacing: 1.2,
                                    color: AppColors.primary,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Expanded(
                            child: Text(
                              item.quote,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Text(
                            item.author,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.role,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textMuted,
                                ),
                          ),
                        ],
                      ),
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
