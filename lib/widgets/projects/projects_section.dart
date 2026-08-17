import 'package:flutter/material.dart';

import '../../core/animations/fade_slide_in.dart';
import '../../data/portfolio_data.dart';
import '../common/app_container.dart';
import '../common/section_header.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      sectionKey: sectionKey,
      semanticLabel: 'Selected work',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FadeSlideIn(
            child: SectionHeader(
              eyebrow: 'Portfolio',
              title: 'Selected Work',
              subtitle:
                  "A selection of real-world applications and products I've worked on.",
            ),
          ),
          const SizedBox(height: 36),
          for (var i = 0; i < PortfolioData.projects.length; i++) ...[
            FadeSlideIn(
              delay: Duration(milliseconds: 60 * i),
              child: ProjectCard(
                project: PortfolioData.projects[i],
                imageFirst: i.isEven,
              ),
            ),
            if (i != PortfolioData.projects.length - 1) const SizedBox(height: 22),
          ],
        ],
      ),
    );
  }
}
