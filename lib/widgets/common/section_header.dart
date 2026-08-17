import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/responsive/breakpoints.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.align = TextAlign.left,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    final centered = align == TextAlign.center;
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primary,
                letterSpacing: 2.4,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 12),
        Semantics(
          header: true,
          child: Text(
            title,
            textAlign: align,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: context.responsive(
                    mobile: 28,
                    tablet: 34,
                    desktop: 40,
                  ),
                ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              textAlign: align,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}
