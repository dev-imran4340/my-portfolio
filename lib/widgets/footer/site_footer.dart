import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/navigation/section_nav.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/cv.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../common/app_container.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: AppContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Column(
            children: [
              Divider(color: AppColors.border, height: 1),
              const SizedBox(height: 28),
              Flex(
                direction: context.isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: context.isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        PortfolioData.name.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              letterSpacing: 1.6,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        PortfolioData.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  if (context.isMobile) const SizedBox(height: 18),
                  Wrap(
                    spacing: 18,
                    runSpacing: 10,
                    children: [
                      _FooterLink(
                        label: 'LinkedIn',
                        onTap: () =>
                            openExternalUrl(context, PortfolioData.linkedinUrl),
                      ),
                      
                      _FooterLink(
                        label: 'Email',
                        onTap: () => openEmail(context, PortfolioData.email),
                      ),
                      _FooterLink(
                        label: 'CV',
                        onTap: openCv,
                      ),
                      _FooterLink(
                        label: 'Contact',
                        onTap: () => SectionNav.maybeOf(context)
                            ?.scrollTo(context, SectionIds.contact),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    '© 2026 ${PortfolioData.name}. All rights reserved.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label),
    );
  }
}
