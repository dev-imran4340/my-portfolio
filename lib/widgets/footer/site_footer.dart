import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/navigation/section_nav.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/cv.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../common/app_button.dart';
import '../common/app_container.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  static const _quickLinks = <(String, String)>[
    ('Home', SectionIds.home),
    ('About', SectionIds.about),
    ('Projects', SectionIds.projects),
    ('Experience', SectionIds.experience),
    ('Blog', SectionIds.blog),
    ('Services', SectionIds.services),
    ('Contact', SectionIds.contact),
  ];

  @override
  Widget build(BuildContext context) {
    final stacked = context.isCompact;

    return ColoredBox(
      color: AppColors.secondaryBackground,
      child: AppContainer(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, stacked ? 48 : 64, 0, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (stacked)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _IntroColumn(),
                    const SizedBox(height: 36),
                    const _QuickLinksColumn(),
                    const SizedBox(height: 36),
                    const _SocialColumn(),
                    const SizedBox(height: 36),
                    const _HireColumn(),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 5, child: _IntroColumn()),
                    const SizedBox(width: 32),
                    const Expanded(flex: 3, child: _QuickLinksColumn()),
                    const SizedBox(width: 24),
                    const Expanded(flex: 3, child: _SocialColumn()),
                    const SizedBox(width: 24),
                    const Expanded(flex: 4, child: _HireColumn()),
                  ],
                ),
              const SizedBox(height: 40),
              Divider(color: AppColors.border, height: 1),
              const SizedBox(height: 20),
              Flex(
                direction: stacked ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: stacked
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    '© 2026 ${PortfolioData.name}. All rights reserved.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                  if (stacked) const SizedBox(height: 8),
                  Text(
                    '${PortfolioData.location} · ${PortfolioData.title}',
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

class _IntroColumn extends StatelessWidget {
  const _IntroColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                PortfolioData.shortName,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                    ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PortfolioData.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    PortfolioData.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.accent,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          PortfolioData.positioning,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.65,
              ),
        ),
      ],
    );
  }
}

class _QuickLinksColumn extends StatelessWidget {
  const _QuickLinksColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ColumnTitle('Quick Links'),
        const SizedBox(height: 16),
        for (final item in SiteFooter._quickLinks) ...[
          _FooterTextLink(
            label: item.$1,
            onTap: () => SectionNav.maybeOf(context)?.scrollTo(context, item.$2),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _SocialColumn extends StatelessWidget {
  const _SocialColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ColumnTitle('Social'),
        const SizedBox(height: 16),
        _SocialRow(
          icon: Icons.work_outline,
          label: 'LinkedIn',
          onTap: () => openExternalUrl(context, PortfolioData.linkedinUrl),
        ),
        const SizedBox(height: 12),
        _SocialRow(
          icon: Icons.mail_outline,
          label: 'Email',
          onTap: () => openEmail(context, PortfolioData.email),
        ),
        const SizedBox(height: 12),
        _SocialRow(
          icon: Icons.phone_outlined,
          label: 'Phone',
          onTap: () => openExternalUrl(context, 'tel:${PortfolioData.phone}'),
        ),
        const SizedBox(height: 12),
        _SocialRow(
          icon: Icons.description_outlined,
          label: 'Download CV',
          onTap: openCv,
        ),
      ],
    );
  }
}

class _HireColumn extends StatelessWidget {
  const _HireColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ColumnTitle('Hire Me'),
        const SizedBox(height: 16),
        Text(
          'Available for senior Flutter roles and freelance product builds. Let’s talk scope, timeline, and fit.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.65,
              ),
        ),
        const SizedBox(height: 20),
        AppButton(
          label: 'Hire Me',
          icon: Icons.handshake_outlined,
          onPressed: () => SectionNav.maybeOf(context)
              ?.scrollTo(context, SectionIds.contact),
        ),
        const SizedBox(height: 12),
        AppButton(
          label: 'Get in Touch',
          variant: AppButtonVariant.outline,
          icon: Icons.arrow_outward,
          onPressed: () => openEmail(context, PortfolioData.email),
        ),
      ],
    );
  }
}

class _ColumnTitle extends StatelessWidget {
  const _ColumnTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primary,
            letterSpacing: 1.6,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

class _FooterTextLink extends StatefulWidget {
  const _FooterTextLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_FooterTextLink> createState() => _FooterTextLinkState();
}

class _FooterTextLinkState extends State<_FooterTextLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _hover ? AppColors.textPrimary : AppColors.textSecondary,
                fontWeight: _hover ? FontWeight.w600 : FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

class _SocialRow extends StatefulWidget {
  const _SocialRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  State<_SocialRow> createState() => _SocialRowState();
}

class _SocialRowState extends State<_SocialRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 16,
              color: _hover ? AppColors.primary : AppColors.accent,
            ),
            const SizedBox(width: 10),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        _hover ? AppColors.textPrimary : AppColors.textSecondary,
                    fontWeight: _hover ? FontWeight.w600 : FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
