import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/animated_hero_name.dart';
import '../../core/animations/reveal.dart';
import '../../core/animations/typewriter_text.dart';
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
      constraints: BoxConstraints(minHeight: height * (desktop ? 1.05 : 1.0)),
      child: Stack(
        children: [
          const Positioned.fill(child: HeroBackground()),
          AppContainer(
            child: Padding(
              padding: EdgeInsets.only(
                top: context.responsive(mobile: 120, tablet: 132, desktop: 148),
                bottom: context.responsive(mobile: 64, tablet: 80, desktop: 96),
              ),
              child: desktop
                  ? const _DesktopHero()
                  : const _MobileHero(),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(flex: 7, child: _HeroCopySequence()),
        const SizedBox(width: 64),
        Expanded(
          flex: 5,
          child: Reveal(
            delay: const Duration(milliseconds: 1600),
            direction: RevealDirection.right,
            scaleFrom: 0.94,
            child: const HeroVisual(),
          ),
        ),
      ],
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroCopySequence(),
        const SizedBox(height: 40),
        Reveal(
          delay: const Duration(milliseconds: 1500),
          direction: RevealDirection.up,
          scaleFrom: 0.96,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: const HeroVisual(),
          ),
        ),
      ],
    );
  }
}

class _HeroCopySequence extends StatelessWidget {
  const _HeroCopySequence();

  @override
  Widget build(BuildContext context) {
    final expandButtons = context.isMobile;
    final nameSize = context.responsive(mobile: 36.0, tablet: 48.0, desktop: 58.0);
    final headlineSize =
        context.responsive(mobile: 22.0, tablet: 28.0, desktop: 32.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Reveal(
          delay: const Duration(milliseconds: 120),
          direction: RevealDirection.down,
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
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    PortfolioData.heroStatusBadge,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 11.5,
                          color: AppColors.textPrimary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: context.responsive(mobile: 28, desktop: 36)),
        Reveal(
          delay: const Duration(milliseconds: 280),
          direction: RevealDirection.up,
          child: AnimatedHeroName(
            name: PortfolioData.name,
            fontSize: nameSize,
          ),
        ),
        SizedBox(height: context.responsive(mobile: 10, desktop: 14)),
        Reveal(
          delay: const Duration(milliseconds: 420),
          direction: RevealDirection.left,
          child: Text(
            PortfolioData.title.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  letterSpacing: 3.2,
                  fontSize: 12,
                  color: AppColors.accent,
                ),
          ),
        ),
        SizedBox(height: context.responsive(mobile: 28, desktop: 36)),
        Reveal(
          delay: const Duration(milliseconds: 560),
          direction: RevealDirection.up,
          child: TypewriterText(
            text: PortfolioData.heroHeadline,
            highlight: PortfolioData.heroHeadlineHighlight,
            startDelay: const Duration(milliseconds: 200),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: headlineSize,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
            highlightStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: headlineSize,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
          ),
        ),
        SizedBox(height: context.responsive(mobile: 28, desktop: 32)),
        for (var i = 0; i < PortfolioData.heroIntroLines.length; i++)
          Reveal(
            delay: Duration(milliseconds: 1100 + (i * 220)),
            direction: i.isEven ? RevealDirection.left : RevealDirection.right,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Text(
                  PortfolioData.heroIntroLines[i],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: context.responsive(mobile: 15, desktop: 17),
                        height: 1.65,
                      ),
                ),
              ),
            ),
          ),
        SizedBox(height: context.responsive(mobile: 24, desktop: 28)),
        Reveal(
          delay: const Duration(milliseconds: 1900),
          direction: RevealDirection.up,
          child: Wrap(
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
        ),
      ],
    );
  }
}
