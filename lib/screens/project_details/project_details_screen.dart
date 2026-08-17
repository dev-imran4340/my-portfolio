import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/seo.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_container.dart';
import '../../widgets/projects/device_mockup.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.slug});

  final String slug;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final project = PortfolioData.projectBySlug(widget.slug);
    setPageTitle(
      project == null
          ? PortfolioData.seoTitle
          : '${project.name} | ${PortfolioData.name}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final project = PortfolioData.projectBySlug(widget.slug);
    if (project == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Project not found', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              AppButton(
                label: 'Back to work',
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      );
    }

    final study = project.caseStudy;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.background,
              pinned: true,
              leading: IconButton(
                tooltip: 'Back to portfolio',
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(
                project.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SliverToBoxAdapter(
              child: AppContainer(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: context.sectionPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.category.toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.primary,
                              letterSpacing: 1.6,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Semantics(
                        header: true,
                        child: Text(
                          project.name,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: context.responsive(
                                  mobile: 32,
                                  tablet: 40,
                                  desktop: 48,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        project.summary,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 28),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: AspectRatio(
                          aspectRatio: context.isMobile ? 1.1 : 16 / 8,
                          child: ProjectVisual(project: project),
                        ),
                      ),
                      const SizedBox(height: 36),
                      _Section(title: 'Overview', body: study.overview),
                      _Section(title: 'Problem', body: study.problem),
                      _Section(title: 'Solution', body: study.solution),
                      _Section(title: 'My Role', body: study.myRole),
                      _Highlight(
                        title: 'My Contribution',
                        body: study.myContribution,
                      ),
                      _ListSection(title: 'Key Features', items: study.keyFeatures),
                      _Chips(title: 'Technologies', items: study.technologies),
                      _Section(title: 'Architecture', body: study.architecture),
                      _ListSection(title: 'Challenges', items: study.challenges),
                      _Section(
                        title: 'Screenshots',
                        body: study.screenshotNotes,
                      ),
                      _Section(title: 'Results', body: study.results),
                      const SizedBox(height: 8),
                      Text('Links', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (final link in study.links)
                            AppButton(
                              label: link.label,
                              variant: AppButtonVariant.outline,
                              onPressed: () => openExternalUrl(context, link.url),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 10),
          Text(body, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 10),
          Text(body, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _ListSection extends StatelessWidget {
  const _ListSection({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(Icons.circle, size: 6, color: AppColors.primary),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(item, style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in items)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
