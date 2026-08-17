import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/navigation/section_nav.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/utils/motion.dart';
import '../../core/utils/cv.dart';
import '../../core/utils/url_utils.dart';
import '../../data/portfolio_data.dart';
import '../common/app_button.dart';

class SiteNavbar extends StatelessWidget {
  const SiteNavbar({
    super.key,
    required this.scrolled,
    required this.menuOpen,
    required this.onToggleMenu,
    required this.activeSection,
  });

  final bool scrolled;
  final bool menuOpen;
  final VoidCallback onToggleMenu;
  final String activeSection;

  @override
  Widget build(BuildContext context) {
    final compact = !context.isDesktop;

    return AnimatedContainer(
      duration: Motion.of(context, const Duration(milliseconds: 220)),
      margin: EdgeInsets.fromLTRB(
        context.pagePadding,
        scrolled || compact ? 12 : 18,
        context.pagePadding,
        0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: scrolled || menuOpen ? 16 : 0,
            sigmaY: scrolled || menuOpen ? 16 : 0,
          ),
          child: AnimatedContainer(
            duration: Motion.of(context, const Duration(milliseconds: 220)),
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 14 : 18,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: scrolled || menuOpen
                  ? const Color(0xCC0D111A)
                  : const Color(0x66080B12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scrolled || menuOpen
                    ? AppColors.border
                    : Colors.transparent,
              ),
            ),
            child: compact
                ? _MobileBar(
                    menuOpen: menuOpen,
                    onToggleMenu: onToggleMenu,
                  )
                : _DesktopBar(activeSection: activeSection),
          ),
        ),
      ),
    );
  }
}

class _DesktopBar extends StatelessWidget {
  const _DesktopBar({required this.activeSection});

  final String activeSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Brand(),
        const Spacer(),
        for (final item in PortfolioData.navItems)
          _NavLink(
            label: item.label,
            selected: activeSection == item.sectionId,
            onTap: () => SectionNav.of(context).scrollTo(context, item.sectionId),
          ),
        const SizedBox(width: 12),
        IconActionButton(
          icon: Icons.work_outline,
          tooltip: 'LinkedIn',
          onPressed: () => openExternalUrl(context, PortfolioData.linkedinUrl),
        ),
        const SizedBox(width: 10),
        AppButton(
          label: 'Download CV',
          onPressed: openCv,
        ),
      ],
    );
  }
}

class _MobileBar extends StatelessWidget {
  const _MobileBar({
    required this.menuOpen,
    required this.onToggleMenu,
  });

  final bool menuOpen;
  final VoidCallback onToggleMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Brand(),
        const Spacer(),
        Semantics(
          button: true,
          label: menuOpen ? 'Close menu' : 'Open menu',
          child: InkWell(
            onTap: onToggleMenu,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: AlwaysStoppedAnimation(menuOpen ? 1 : 0),
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SectionNav.of(context).scrollTo(context, SectionIds.home),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderStrong),
                color: AppColors.card,
              ),
              child: Text(
                PortfolioData.shortName,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.primary,
                      fontSize: 12,
                    ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              PortfolioData.name.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    letterSpacing: 1.4,
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.onTap,
    required this.selected,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.selected || _hover;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: Motion.of(context, const Duration(milliseconds: 160)),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: active ? AppColors.textPrimary : AppColors.textSecondary,
                  fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 13.5,
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.label),
                  const SizedBox(height: 5),
                  AnimatedContainer(
                    duration: Motion.of(context, const Duration(milliseconds: 160)),
                    height: 2,
                    width: widget.selected ? 16 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileMenuOverlay extends StatelessWidget {
  const MobileMenuOverlay({
    super.key,
    required this.onClose,
    required this.activeSection,
  });

  final VoidCallback onClose;
  final String activeSection;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xF2080B12),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 88, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in PortfolioData.navItems)
                _MobileItem(
                  label: item.label,
                  selected: activeSection == item.sectionId,
                  onTap: () {
                    onClose();
                    SectionNav.of(context).scrollTo(context, item.sectionId);
                  },
                ),
              const Spacer(),
              Row(
                children: [
                  IconActionButton(
                    icon: Icons.work_outline,
                    tooltip: 'LinkedIn',
                    onPressed: () =>
                        openExternalUrl(context, PortfolioData.linkedinUrl),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Download CV',
                expand: true,
                onPressed: openCv,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileItem extends StatelessWidget {
  const _MobileItem({
    required this.label,
    required this.onTap,
    required this.selected,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: selected ? AppColors.primary : AppColors.textPrimary,
                fontSize: 28,
              ),
        ),
      ),
    );
  }
}
