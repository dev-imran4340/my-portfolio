import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/navigation/section_nav.dart';
import '../../core/utils/seo.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/about/about_section.dart';
import '../../widgets/blog/blog_section.dart';
import '../../widgets/contact/contact_section.dart';
import '../../widgets/experience/experience_section.dart';
import '../../widgets/footer/site_footer.dart';
import '../../widgets/hero/hero_section.dart';
import '../../widgets/navbar/site_navbar.dart';
import '../../widgets/projects/projects_section.dart';
import '../../widgets/services/services_section.dart';
import '../../widgets/skills/skills_section.dart';
import '../../widgets/stats/stats_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialSection});

  final String? initialSection;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late final Map<String, GlobalKey> _keys;
  bool _scrolled = false;
  bool _menuOpen = false;
  String _active = SectionIds.home;

  @override
  void initState() {
    super.initState();
    _keys = SectionIds.createKeys();
    _scrollController.addListener(_onScroll);
    setPageTitle(PortfolioData.seoTitle);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final section = widget.initialSection;
      if (section != null && mounted) {
        SectionNav(
          controller: _scrollController,
          keys: _keys,
          child: const SizedBox.shrink(),
        ).scrollTo(context, section);
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final scrolled = offset > 16;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
    _updateActiveSection();
  }

  void _updateActiveSection() {
    var current = SectionIds.home;
    for (final entry in _keys.entries) {
      final box = entry.value.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final y = box.localToGlobal(Offset.zero).dy;
      if (y <= 140) current = entry.key;
    }
    if (current != _active) {
      setState(() => _active = current);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionNav(
      controller: _scrollController,
      keys: _keys,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            SelectionArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: HeroSection(sectionKey: _keys[SectionIds.home]!),
                  ),
                  SliverToBoxAdapter(
                    child: AboutSection(sectionKey: _keys[SectionIds.about]!),
                  ),
                  SliverToBoxAdapter(
                    child: SkillsSection(sectionKey: _keys[SectionIds.skills]!),
                  ),
                  const SliverToBoxAdapter(child: StatsSection()),
                  SliverToBoxAdapter(
                    child: ProjectsSection(sectionKey: _keys[SectionIds.projects]!),
                  ),
                  SliverToBoxAdapter(
                    child: ExperienceSection(
                      sectionKey: _keys[SectionIds.experience]!,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlogSection(sectionKey: _keys[SectionIds.blog]!),
                  ),
                  SliverToBoxAdapter(
                    child: ServicesSection(sectionKey: _keys[SectionIds.services]!),
                  ),
                  SliverToBoxAdapter(
                    child: ContactSection(sectionKey: _keys[SectionIds.contact]!),
                  ),
                  const SliverToBoxAdapter(child: SiteFooter()),
                ],
              ),
            ),
            if (_menuOpen)
              Positioned.fill(
                child: MobileMenuOverlay(
                  activeSection: _active,
                  onClose: () => setState(() => _menuOpen = false),
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: SiteNavbar(
                  scrolled: _scrolled,
                  menuOpen: _menuOpen,
                  activeSection: _active,
                  onToggleMenu: () => setState(() => _menuOpen = !_menuOpen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
