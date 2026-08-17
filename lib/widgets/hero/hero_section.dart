import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
import '../../core/navigation/section_nav.dart';
import '../../core/responsive/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../common/app_button.dart';
import '../common/app_container.dart';
import 'hero_background.dart';
import 'hero_visual.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final desktop = context.isDesktop;
    final height = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      key: sectionKey,
      constraints: BoxConstraints(minHeight: height),
      child: Stack(
        children: [
          const Positioned.fill(child: HeroBackground()),
          AppContainer(
            child: Padding(
              padding: EdgeInsets.only(
                top: context.responsive(mobile: 120, tablet: 132, desktop: 140),
                bottom: context.responsive(mobile: 56, tablet: 72, desktop: 80),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height - 180),
                child: desktop
                    ? const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 6, child: _HeroCopy()),
                          SizedBox(width: 56),
                          Expanded(flex: 5, child: HeroVisual()),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _HeroCopy(),
                          const SizedBox(height: 40),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 460),
                            child: const HeroVisual(),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    final expandButtons = context.isMobile;

    return FadeSlideIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.responsive(
                mobile: double.infinity,
                tablet: 520,
                desktop: 560,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.28),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      PortfolioData.heroStatusBadge,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 11.5,
                            height: 1.35,
                            color: AppColors.textPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Semantics(
            header: true,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: PortfolioData.heroHeadlineLead),
                  TextSpan(
                    text: PortfolioData.heroHeadlineHighlight,
                    style: const TextStyle(color: AppColors.primary),
                  ),
                  if (PortfolioData.heroHeadlineTrail.isNotEmpty)
                    TextSpan(text: PortfolioData.heroHeadlineTrail),
                ],
              ),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: context.responsive(
                      mobile: 30,
                      tablet: 40,
                      desktop: 48,
                    ),
                    height: 1.15,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              PortfolioData.heroDescription,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: context.responsive(mobile: 15, desktop: 17),
                  ),
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: expandButtons ? double.infinity : null,
                child: AppButton(
                  label: PortfolioData.primaryCtaLabel,
                  expand: expandButtons,
                  onPressed: () => SectionNav.of(context)
                      .scrollTo(context, SectionIds.projects),
                ),
              ),
              SizedBox(
                width: expandButtons ? double.infinity : null,
                child: AppButton(
                  label: PortfolioData.secondaryCtaLabel,
                  variant: AppButtonVariant.outline,
                  expand: expandButtons,
                  onPressed: () => SectionNav.of(context)
                      .scrollTo(context, SectionIds.contact),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
