import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavItem {
  const NavItem({required this.label, required this.sectionId});

  final String label;
  final String sectionId;
}

class SocialLink {
  const SocialLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

class StatItem {
  const StatItem({required this.value, required this.label});

  final String value;
  final String label;
}

class SkillItem {
  const SkillItem({required this.name, required this.icon});

  final String name;
  final IconData icon;
}

class SkillCategory {
  const SkillCategory({required this.title, required this.items});

  final String title;
  final List<SkillItem> items;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class ExperienceRole {
  const ExperienceRole({
    required this.title,
    required this.company,
    required this.period,
    required this.responsibilities,
  });

  final String title;
  final String company;
  final String period;
  final List<String> responsibilities;
}

class EducationEntry {
  const EducationEntry({
    required this.degree,
    required this.institution,
    required this.period,
    this.details = const [],
  });

  final String degree;
  final String institution;
  final String period;
  final List<String> details;
}

class Testimonial {
  const Testimonial({
    required this.quote,
    required this.author,
    required this.role,
    this.isPlaceholder = true,
  });

  final String quote;
  final String author;
  final String role;
  final bool isPlaceholder;
}

class GithubRepoPlaceholder {
  const GithubRepoPlaceholder({
    required this.name,
    required this.description,
    required this.language,
    required this.url,
  });

  final String name;
  final String description;
  final String language;
  final String url;
}

class Project {
  const Project({
    required this.slug,
    required this.name,
    required this.category,
    required this.summary,
    required this.technologies,
    required this.features,
    required this.accent,
    required this.caseStudy,
    this.screenshotAsset,
    this.liveUrl,
    this.repoUrl,
  });

  final String slug;
  final String name;
  final String category;
  final String summary;
  final List<String> technologies;
  final List<String> features;
  final Color accent;
  final ProjectCaseStudy caseStudy;
  final String? screenshotAsset;
  final String? liveUrl;
  final String? repoUrl;
}

class ProjectCaseStudy {
  const ProjectCaseStudy({
    required this.overview,
    required this.problem,
    required this.solution,
    required this.myRole,
    required this.myContribution,
    required this.keyFeatures,
    required this.technologies,
    required this.architecture,
    required this.challenges,
    required this.results,
    this.links = const [],
    this.screenshotNotes = '[PROJECT_SCREENSHOT]',
  });

  final String overview;
  final String problem;
  final String solution;
  final String myRole;
  final String myContribution;
  final List<String> keyFeatures;
  final List<String> technologies;
  final String architecture;
  final List<String> challenges;
  final String results;
  final List<ProjectLink> links;
  final String screenshotNotes;
}

class ProjectLink {
  const ProjectLink({required this.label, required this.url});

  final String label;
  final String url;
}

abstract final class SkillIcons {
  static const flutter = FontAwesomeIcons.flutter;
  static const dart = FontAwesomeIcons.code;
  static const android = FontAwesomeIcons.android;
  static const apple = FontAwesomeIcons.apple;
  static const getx = FontAwesomeIcons.bolt;
  static const provider = FontAwesomeIcons.cubes;
  static const riverpod = FontAwesomeIcons.water;
  static const firebase = FontAwesomeIcons.fire;
  static const rest = FontAwesomeIcons.networkWired;
  static const firestore = FontAwesomeIcons.database;
  static const fcm = FontAwesomeIcons.bell;
  static const storage = FontAwesomeIcons.cloud;
  static const architecture = FontAwesomeIcons.layerGroup;
  static const mvvm = FontAwesomeIcons.diagramProject;
  static const repository = FontAwesomeIcons.boxOpen;
  static const solid = FontAwesomeIcons.cubesStacked;
  static const hive = FontAwesomeIcons.boxArchive;
  static const sqlite = FontAwesomeIcons.table;
  static const git = FontAwesomeIcons.gitAlt;
  static const github = FontAwesomeIcons.github;
  static const xcode = FontAwesomeIcons.hammer;
  static const androidStudio = FontAwesomeIcons.android;
  static const nextjs = FontAwesomeIcons.n;
  static const maps = FontAwesomeIcons.mapLocationDot;
  static const payments = FontAwesomeIcons.creditCard;
}
