import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/animations/reveal.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/motion.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../../models/portfolio_models.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      sectionKey: sectionKey,
      background: AppColors.secondaryBackground,
      semanticLabel: 'Blog',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(
            awaitVisible: true,
            direction: RevealDirection.left,
            child: SectionHeader(
              eyebrow: 'Writing',
              title: 'Blog',
              subtitle:
                  'Notes on Flutter architecture, state management, and shipping production apps.',
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 1000
                  ? 3
                  : constraints.maxWidth >= 700
                      ? 2
                      : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.blogPosts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  mainAxisExtent: context.isMobile ? 280 : 300,
                ),
                itemBuilder: (context, index) {
                  return Reveal(
                    awaitVisible: true,
                    delay: Duration(milliseconds: 100 * index),
                    direction: index.isEven
                        ? RevealDirection.up
                        : RevealDirection.right,
                    scaleFrom: 0.96,
                    child: _BlogCard(post: PortfolioData.blogPosts[index]),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatefulWidget {
  const _BlogCard({required this.post});

  final BlogPost post;

  @override
  State<_BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<_BlogCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: Motion.of(context, const Duration(milliseconds: 200)),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hover
                ? AppColors.primary.withValues(alpha: 0.4)
                : AppColors.border,
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 14),
                  ),
                ]
              : null,
        ),
        child: InkWell(
          onTap: () => openExternalUrl(context, post.url),
          borderRadius: BorderRadius.circular(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppColors.textMuted,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    post.readTime,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                post.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      height: 1.3,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  post.excerpt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final tag in post.tags)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        tag,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.accent,
                            ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 18),
              AnimatedDefaultTextStyle(
                duration: Motion.of(context, const Duration(milliseconds: 160)),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: _hover ? AppColors.primary : AppColors.textPrimary,
                      fontSize: 13,
                    ),
                child: Row(
                  children: [
                    Text(_hover ? 'Read article' : 'Read article'),
                    const SizedBox(width: 6),
                    AnimatedSlide(
                      duration: Motion.of(
                        context,
                        const Duration(milliseconds: 160),
                      ),
                      offset: Offset(_hover ? 0.15 : 0, 0),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 14,
                        color: _hover ? AppColors.primary : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
