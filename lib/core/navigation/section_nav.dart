import 'package:flutter/material.dart';

import '../utils/motion.dart';

class SectionNav extends InheritedWidget {
  const SectionNav({
    super.key,
    required this.controller,
    required this.keys,
    required super.child,
  });

  final ScrollController controller;
  final Map<String, GlobalKey> keys;

  static SectionNav of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SectionNav>();
    assert(scope != null, 'SectionNav not found');
    return scope!;
  }

  static SectionNav? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SectionNav>();
  }

  Future<void> scrollTo(BuildContext context, String id) async {
    final target = keys[id]?.currentContext;
    if (target == null) return;
    await Scrollable.ensureVisible(
      target,
      duration: Motion.of(context, const Duration(milliseconds: 620)),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  bool updateShouldNotify(SectionNav oldWidget) {
    return controller != oldWidget.controller || keys != oldWidget.keys;
  }
}

abstract final class SectionIds {
  static const home = 'home';
  static const about = 'about';
  static const skills = 'skills';
  static const projects = 'projects';
  static const experience = 'experience';
  static const services = 'services';
  static const github = 'github';
  static const testimonials = 'testimonials';
  static const contact = 'contact';

  static Map<String, GlobalKey> createKeys() {
    return {
      home: GlobalKey(),
      about: GlobalKey(),
      skills: GlobalKey(),
      projects: GlobalKey(),
      experience: GlobalKey(),
      services: GlobalKey(),
      github: GlobalKey(),
      testimonials: GlobalKey(),
      contact: GlobalKey(),
    };
  }
}
