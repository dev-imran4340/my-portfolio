import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
import '../../core/responsive/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../models/portfolio_models.dart';
import '../common/app_container.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.responsive(mobile: 8, desktop: 12),
        bottom: context.responsive(mobile: 8, desktop: 12),
      ),
      child: AppContainer(
      child: FadeSlideIn(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: context.responsive(mobile: 18, desktop: 28),
            vertical: context.responsive(mobile: 22, desktop: 28),
          ),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.border),
          ),
          child: context.isMobile
              ? Column(
                  children: [
                    for (var i = 0; i < PortfolioData.stats.length; i++) ...[
                      _StatCell(item: PortfolioData.stats[i]),
                      if (i != PortfolioData.stats.length - 1)
                        const Divider(height: 28, color: AppColors.border),
                    ],
                  ],
                )
              : Row(
                  children: [
                    for (var i = 0; i < PortfolioData.stats.length; i++) ...[
                      Expanded(child: _StatCell(item: PortfolioData.stats[i])),
                      if (i != PortfolioData.stats.length - 1)
                        Container(
                          width: 1,
                          height: 56,
                          color: AppColors.border,
                        ),
                    ],
                  ],
                ),
        ),
      ),
    ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.item});

  final StatItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        children: [
          Text(
            item.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: context.responsive(mobile: 24, desktop: 30),
                ),
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
