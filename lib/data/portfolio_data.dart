import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app/theme/app_colors.dart';
import '../models/portfolio_models.dart';

/// Central content for the Flutter Web portfolio.
/// Replace placeholders marked YOUR_* / [ ... ] with real links and contact info.
abstract final class PortfolioData {
  static const name = 'Malik Muhammad Imran';
  static const shortName = 'IM';
  static const title = 'Senior Flutter Developer';
  static const location = 'Rawalpindi, Pakistan';
  static const company = 'Softect Business Services';

  static const fullName = 'Malik Muhammad Imran';
  static const seoTitle = 'Malik Muhammad Imran | Senior Flutter Developer';
  static const seoDescription =
      'Malik Muhammad Imran — Senior Flutter Developer in Rawalpindi, Pakistan. Production Android, iOS and Web apps with Clean Architecture, API integrations and high-performance UI.';

  // Contact
  static const email = 'imran.dev4340@gmail.com';
  static const phone = '+92 3125884340';
  static const linkedinUrl = 'https://www.linkedin.com/in/malik-imran-2a594525a';
  static const githubUrl = 'YOUR_GITHUB_LINK';

  /// Bundled CV for Flutter asset loading (`rootBundle`).
  static const cvAssetPath = 'assets/cv.pdf';

  /// Public URL path on GitHub Pages / Flutter Web (copied to `build/web/cv.pdf`).
  static const cvPublicPath = 'cv.pdf';
  static const cvDownloadFileName = 'Malik_Muhammad_Imran_CV.pdf';

  /// Relative link used by Download CV (resolves correctly with `--base-href`).
  static const cvUrl = './cv.pdf';

  static const positioning =
      'Senior Mobile Developer with over 4 years delivering production-grade Android, iOS and Web applications with Flutter.';

  static const heroStatusBadge =
      'Available for Senior Mobile Roles & High-Impact Freelance Projects';

  static const heroHeadlineLead = 'Engineering Scalable Cross-Platform Mobile Apps with ';
  static const heroHeadlineHighlight = 'Flutter';
  static const heroHeadlineTrail = '';

  static const heroDescription =
      'Senior Mobile Developer with over 4 years of experience delivering production-grade Android, iOS, and Web applications. I specialize in Clean Architecture, complex API integrations, and pixel-perfect UI performance.';

  static const primaryCtaLabel = 'Explore Selected Work';
  static const secondaryCtaLabel = 'Get in Touch';

  static const aboutHeading = 'Crafting High-Performance Mobile Experiences';

  static const aboutParagraphs = <String>[
    'I am Malik Muhammad Imran, a Senior Flutter Developer based in Rawalpindi, Pakistan. Over the past 4+ years, I’ve helped startups and businesses turn complex requirements into robust, published mobile applications.',
    'My engineering philosophy centers around Clean Architecture, maintainable codebase structures, and performance optimization. Whether it\'s integrating real-time features, custom state management with Provider/GetX, or configuring CI/CD deployment pipelines, I focus on building software that scales seamlessly.',
    'I hold a Bachelor’s degree in Computer Science from NUML (GPA 3.27/4.0), where my capstone project involved developing a Generative AI Assistant for Healthcare.',
  ];

  /// Combined about body for any consumers that still expect a single string.
  static String get aboutBody => aboutParagraphs.join('\n\n');

  static const contactHeading = 'Get in Touch';
  static const contactDescription =
      'Looking for a Senior Flutter Developer for a product team or a freelance build? Send a note — I’m happy to talk through scope, timelines and fit.';

  static const navItems = <NavItem>[
    NavItem(label: 'Home', sectionId: 'home'),
    NavItem(label: 'About', sectionId: 'about'),
    NavItem(label: 'Skills', sectionId: 'skills'),
    NavItem(label: 'Projects', sectionId: 'projects'),
    NavItem(label: 'Experience', sectionId: 'experience'),
    NavItem(label: 'Services', sectionId: 'services'),
    NavItem(label: 'Contact', sectionId: 'contact'),
  ];

  static const socials = <SocialLink>[
  
    SocialLink(
      label: 'LinkedIn',
      url: linkedinUrl,
      icon: FontAwesomeIcons.linkedinIn,
    ),
  ];

  /// Stats aligned with CV positioning (no inflated project counts).
  static const stats = <StatItem>[
    StatItem(value: '4+', label: 'Years Experience'),
    StatItem(value: '3+', label: 'Platforms (Android, iOS, Web)'),
    StatItem(value: '4+', label: 'Companies'),
    StatItem(value: '3.27', label: 'BSCS GPA'),
  ];

  static const aboutHighlights = <StatItem>[
    StatItem(value: '4+', label: 'Years Experience'),
    StatItem(value: 'Android', label: 'iOS & Web'),
    StatItem(value: '4+', label: 'Companies'),
    StatItem(value: 'BSCS', label: 'GPA 3.27'),
  ];

  static const skillCategories = <SkillCategory>[
    SkillCategory(
      title: 'Development',
      items: [
        SkillItem(name: 'Flutter', icon: SkillIcons.flutter),
        SkillItem(name: 'Dart', icon: SkillIcons.dart),
        SkillItem(name: 'Android', icon: SkillIcons.android),
        SkillItem(name: 'iOS', icon: SkillIcons.apple),
        SkillItem(name: 'Next.js', icon: SkillIcons.nextjs),
        SkillItem(name: 'Web', icon: SkillIcons.nextjs),
      ],
    ),
    SkillCategory(
      title: 'State Management',
      items: [
        SkillItem(name: 'GetX', icon: SkillIcons.getx),
        SkillItem(name: 'Provider', icon: SkillIcons.provider),
        SkillItem(name: 'Riverpod', icon: SkillIcons.riverpod),
      ],
    ),
    SkillCategory(
      title: 'Backend & Services',
      items: [
        SkillItem(name: 'Firebase', icon: SkillIcons.firebase),
        SkillItem(name: 'REST APIs', icon: SkillIcons.rest),
        SkillItem(name: 'Firestore', icon: SkillIcons.firestore),
        SkillItem(name: 'FCM', icon: SkillIcons.fcm),
        SkillItem(name: 'Storage', icon: SkillIcons.storage),
      ],
    ),
    SkillCategory(
      title: 'Architecture',
      items: [
        SkillItem(name: 'Clean Architecture', icon: SkillIcons.architecture),
        SkillItem(name: 'MVVM', icon: SkillIcons.mvvm),
        SkillItem(name: 'Repository Pattern', icon: SkillIcons.repository),
        SkillItem(name: 'SOLID', icon: SkillIcons.solid),
      ],
    ),
    SkillCategory(
      title: 'Database & Integrations',
      items: [
        SkillItem(name: 'Hive', icon: SkillIcons.hive),
        SkillItem(name: 'SQLite', icon: SkillIcons.sqlite),
        SkillItem(name: 'Google Maps', icon: SkillIcons.maps),
        SkillItem(name: 'Payment Gateways', icon: SkillIcons.payments),
      ],
    ),
    SkillCategory(
      title: 'Tools & Delivery',
      items: [
        SkillItem(name: 'Git', icon: SkillIcons.git),
        SkillItem(name: 'GitHub', icon: SkillIcons.github),
        SkillItem(name: 'Xcode', icon: SkillIcons.xcode),
        SkillItem(name: 'Android Studio', icon: SkillIcons.androidStudio),
      ],
    ),
  ];

  static const services = <ServiceItem>[
    ServiceItem(
      title: 'Flutter App Development',
      description:
          'Android and iOS apps built with Flutter — from first screen to store release.',
      icon: FontAwesomeIcons.mobileScreen,
    ),
    ServiceItem(
      title: 'API Integration',
      description:
          'Secure REST integrations, auth flows, and reliable data handling between app and backend.',
      icon: FontAwesomeIcons.plug,
    ),
    ServiceItem(
      title: 'Firebase Development',
      description:
          'Auth, Firestore, FCM, Storage and the Firebase pieces that keep a product live.',
      icon: FontAwesomeIcons.fire,
    ),
    ServiceItem(
      title: 'UI Implementation',
      description:
          'Responsive, pixel-accurate Flutter interfaces that stay smooth under real usage.',
      icon: FontAwesomeIcons.penRuler,
    ),
    ServiceItem(
      title: 'App Deployment',
      description:
          'Play Store, App Store and Web releases — builds, signing and release hygiene.',
      icon: FontAwesomeIcons.rocket,
    ),
  ];

  static const education = <EducationEntry>[
    EducationEntry(
      degree: 'Bachelor’s degree in Computer Science',
      institution: 'NUML',
      period: 'Completed',
      details: [
        'GPA: 3.27 / 4.0',
        'Capstone: Generative AI Assistant for Healthcare',
      ],
    ),
  ];

  static const experience = <ExperienceRole>[
    ExperienceRole(
      title: 'Senior Flutter Developer',
      company: 'Softect Business Services',
      period: 'April 2026 – Present',
      responsibilities: [
        'Directing mobile app architecture across Android, iOS, and Web, ensuring high code quality and testability.',
        'Integrating secure RESTful APIs, Firebase backend services, and third-party SDKs for mission-critical client applications.',
        'Leading code reviews and mentoring junior developers to maintain clean, standardized Git workflows.',
      ],
    ),
    ExperienceRole(
      title: 'Senior Flutter Developer',
      company: 'CrypSol Technologies',
      period: 'May 2024 – April 2026',
      responsibilities: [
        'Architected and launched high-performance mobile apps focused on stability, security, and low-latency API interactions.',
        'Applied SOLID principles, Repository pattern, and MVVM/Clean Architecture to streamline feature rollouts.',
      ],
    ),
    ExperienceRole(
      title: 'Junior Flutter Developer',
      company: 'Owasoft Technologies',
      period: 'Dec 2022 – May 2024',
      responsibilities: [
        'Built responsive UI layouts and integrated local databases (Hive/SQLite) alongside state management solutions (GetX/Provider).',
        'Refactored legacy codebases to improve app startup times and memory efficiency.',
      ],
    ),
    ExperienceRole(
      title: 'Flutter Development Intern',
      company: 'Eziline Software House',
      period: '2022',
      responsibilities: [
        'Supported Flutter feature work and UI implementation on live team projects.',
        'Learned production Git workflows, code review habits, and release basics.',
      ],
    ),
  ];

  static const testimonials = <Testimonial>[
    Testimonial(
      quote:
          '[TESTIMONIAL] Replace with a real quote from a manager, client, or teammate.',
      author: '[NAME]',
      role: '[ROLE]',
    ),
    Testimonial(
      quote:
          '[TESTIMONIAL] Replace with feedback on delivery, architecture, or collaboration.',
      author: '[NAME]',
      role: '[ROLE]',
    ),
    Testimonial(
      quote:
          '[TESTIMONIAL] Replace with a note on reliability or release quality.',
      author: '[NAME]',
      role: '[ROLE]',
    ),
  ];

 

  static const projects = <Project>[
    Project(
      slug: 'sbs-accounting',
      name: 'SBS Accounting',
      category: 'Mobile Accounting & Business Management',
      summary:
          'A Flutter business management and accounting app for sales, purchases, products, customers, suppliers, expenses, assets, liabilities and financial reports.',
      technologies: ['Flutter', 'Dart', 'GetX', 'REST API', 'Firebase'],
      features: [
        'Sales & Invoices',
        'Purchases',
        'Products',
        'Customers',
        'Suppliers',
        'Expenses',
        'Assets',
        'Reports',
        'Multiple Companies',
        'Role-Based Permissions',
        'PDF / CSV Export',
      ],
      accent: AppColors.primary,
      screenshotAsset: null,
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'SBS Accounting is a production-style business management and accounting product for day-to-day commercial operations on mobile.',
        problem:
            'Teams needed one mobile workspace for operational and accounting data instead of fragmented tools.',
        solution:
            'A Flutter client that centralizes sales, purchases, inventory, parties, expenses, assets/liabilities and reports, with multi-company support and role-based access.',
        myRole: 'Senior Flutter Developer',
        myContribution:
            'Built and evolved Flutter features across accounting modules, API integration, state management, permission-aware UI and export flows. Focused on maintainable architecture and release-ready quality.',
        keyFeatures: [
          'Sales & invoices',
          'Purchases',
          'Products',
          'Customers & suppliers',
          'Expenses, assets and liabilities',
          'Financial reports',
          'Multiple companies',
          'Role-based permissions',
          'PDF / CSV export',
        ],
        technologies: ['Flutter', 'Dart', 'GetX', 'REST API', 'Firebase'],
        architecture:
            'Feature-oriented Flutter client using GetX for state and navigation, repository-style API access, and Firebase where required. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'Multi-company data and permission-aware screens',
          'Keeping financial lists and reports performant on device',
          'Coordinating REST contracts with export and reporting flows',
        ],
        results:
            'YOUR_RESULTS — add measurable outcomes when available (modules shipped, release cadence, impact).',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
          ProjectLink(label: 'Repository', url: 'YOUR_PROJECT_REPO_URL'),
        ],
      ),
    ),
    Project(
      slug: 'biz-hub',
      name: 'Biz Hub',
      category: 'Business Management Application',
      summary:
          'A Flutter business management application for organizing commercial operations on Android and iOS, backed by REST APIs and GetX state management.',
      technologies: ['Flutter', 'Dart', 'GetX', 'REST API'],
      features: [
        'Business operations workflows',
        'REST-backed data screens',
        'GetX state management',
        'Android & iOS delivery',
      ],
      accent: AppColors.accent,
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'Biz Hub is a cross-platform Flutter client for business management workflows. Replace module-level details when you have product docs or store listing copy.',
        problem:
            'YOUR_PROBLEM — describe the operational gap this product closed.',
        solution:
            'A Flutter + GetX client connected to REST APIs for day-to-day business management screens.',
        myRole: 'Flutter Developer',
        myContribution:
            'Built Flutter client features, REST integrations and GetX state flows for business-management screens. YOUR_MY_CONTRIBUTION — list modules you owned.',
        keyFeatures: [
          'Business operations workflows',
          'REST API integration',
          'Cross-platform Android & iOS UI',
        ],
        technologies: ['Flutter', 'Dart', 'GetX', 'REST API'],
        architecture:
            'Flutter + GetX client with repository-style REST access. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'YOUR_CHALLENGE_1',
          'YOUR_CHALLENGE_2',
        ],
        results: 'YOUR_RESULTS — shipping status or impact when available.',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
        ],
      ),
    ),
    Project(
      slug: 'investment-app',
      name: 'Investment App',
      category: 'Investment / Finance',
      summary:
          'A finance-oriented Flutter app covering authentication, investment workflows, referrals, notifications and a modern dashboard — with Firebase and REST APIs.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'Notifications',
      ],
      features: [
        'User authentication',
        'Investment workflows',
        'Referral system',
        'Firebase',
        'REST APIs',
        'Notifications',
        'Modern dashboard',
      ],
      accent: Color(0xFF5B8DEF),
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'An investment / finance mobile product with authenticated journeys, investment flows, referrals and a dashboard for account activity.',
        problem:
            'Users needed a mobile path to register, follow investment flows and stay informed without a desktop-only process.',
        solution:
            'A Flutter client combining REST APIs for core business data with Firebase for auth/supporting services, plus notifications and referrals.',
        myRole: 'Flutter Developer',
        myContribution:
            'Implemented authentication, investment workflow screens, referral flows, dashboard UI, REST/Firebase integration and notification handling. YOUR_MY_CONTRIBUTION — refine owned modules.',
        keyFeatures: [
          'User authentication',
          'Investment workflows',
          'Referral system',
          'Modern dashboard',
          'Notifications',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'REST APIs',
          'Notifications',
        ],
        architecture:
            'Flutter client with REST-backed domain flows and Firebase for auth/supporting infrastructure. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'Keeping investment states consistent across API and UI',
          'Wiring notification and referral flows cleanly',
        ],
        results: 'YOUR_RESULTS — add traction or release notes when available.',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
        ],
      ),
    ),
    Project(
      slug: 'vpn-application',
      name: 'VPN Application',
      category: 'Networking / Utility',
      summary:
          'A cross-platform VPN utility with connection management, server selection and connection-state handling, including native integration on Android and iOS.',
      technologies: ['Flutter', 'Dart', 'Android', 'iOS', 'Native Integration'],
      features: [
        'VPN connection',
        'Server selection',
        'Connection states',
        'Subscription / configuration where applicable',
        'Native integration',
        'Android & iOS',
      ],
      accent: Color(0xFF4CC38A),
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'A networking utility that lets users connect to a VPN, choose a server and understand connection state on Android and iOS.',
        problem:
            'Users needed a reliable mobile VPN client with clear connection states and platform-correct native behavior.',
        solution:
            'A Flutter app with native integration for tunnel/connection behavior, server selection and explicit connection-state UI.',
        myRole: 'Flutter Developer',
        myContribution:
            'Worked on Flutter UI for connection and server selection, connection-state handling and native integration touchpoints for Android and iOS. YOUR_MY_CONTRIBUTION — specify plugins or modules owned.',
        keyFeatures: [
          'VPN connection',
          'Server selection',
          'Connection states',
          'Native Android & iOS integration',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'Native Integration',
        ],
        architecture:
            'Flutter UI layer with platform channels / native VPN integration. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'Representing connection states clearly across platforms',
          'Coordinating Flutter UI with native VPN lifecycle',
        ],
        results: 'YOUR_RESULTS — add store status or stability notes when available.',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
        ],
      ),
    ),
  ];

  static Project? projectBySlug(String slug) {
    for (final project in projects) {
      if (project.slug == slug) return project;
    }
    return null;
  }
}
