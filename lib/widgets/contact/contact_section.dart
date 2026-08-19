import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/fade_slide_in.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      sectionKey: sectionKey,
      background: AppColors.secondaryBackground,
      semanticLabel: 'Contact',
      child: const FadeSlideIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ContactIntro(),
          ],
        ),
      ),
    );
  }
}

class _ContactIntro extends StatelessWidget {
  const _ContactIntro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Contact',
          title: PortfolioData.contactHeading,
          subtitle: PortfolioData.contactDescription,
        ),
        const SizedBox(height: 28),
        const _ContactRow(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: PortfolioData.location,
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.mail_outline,
          label: 'Email',
          value: PortfolioData.email,
          onTap: () => openEmail(context, PortfolioData.email),
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.phone_outlined,
          label: 'Phone',
          value: PortfolioData.phone,
          onTap: () => openExternalUrl(context, 'tel:${PortfolioData.phone}'),
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.work_outline,
          label: 'LinkedIn',
          value: 'linkedin.com/in/malik-imran-2a594525a',
          onTap: () => openExternalUrl(context, PortfolioData.linkedinUrl),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
