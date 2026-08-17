import 'package:flutter/material.dart';

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

class BlogPost {
  const BlogPost({
    required this.title,
    required this.excerpt,
    required this.date,
    required this.readTime,
    required this.tags,
  });

  final String title;
  final String excerpt;
  final String date;
  final String readTime;
  final List<String> tags;
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
    this.galleryAssets = const [],
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

  /// Extra showcase images shown on the case study page.
  final List<String> galleryAssets;
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
  static const flutter = Icons.flutter_dash;
  static const dart = Icons.code;
  static const android = Icons.android;
  static const apple = Icons.phone_iphone;
  static const getx = Icons.bolt;
  static const provider = Icons.widgets_outlined;
  static const firebase = Icons.local_fire_department;
  static const rest = Icons.lan_outlined;
  static const firestore = Icons.storage_outlined;
  static const fcm = Icons.notifications_active_outlined;
  static const storage = Icons.cloud_outlined;
  static const architecture = Icons.account_tree_outlined;
  static const mvvm = Icons.schema_outlined;
  static const repository = Icons.inventory_2_outlined;
  static const solid = Icons.view_module_outlined;
  static const hive = Icons.archive_outlined;
  static const sqlite = Icons.table_chart_outlined;
  static const git = Icons.merge_type;
  static const github = Icons.code_outlined;
  static const xcode = Icons.build_outlined;
  static const androidStudio = Icons.developer_mode;
  static const nextjs = Icons.language;
  static const maps = Icons.map_outlined;
  static const payments = Icons.payments_outlined;
}
