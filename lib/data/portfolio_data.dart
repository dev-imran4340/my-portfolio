import 'package:flutter/material.dart';

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

  /// Hero portrait shown on the right side of the home hero.
  static const heroImageAsset = 'assets/images/myimg.jpeg';

  static const positioning =
      'Senior Mobile Developer with over 4 years delivering production-grade Android, iOS and Web applications with Flutter.';

  static const heroStatusBadge =
      'Available for Senior Mobile Roles & High-Impact Freelance Projects';

  static const heroHeadline =
      'Engineering Scalable Cross-Platform Mobile Apps with Flutter';

  static const heroHeadlineHighlight = 'Flutter';

  static const heroIntroLines = <String>[
    'Senior Flutter Developer based in Rawalpindi, Pakistan.',
    'I build production Android, iOS and Web apps with clean architecture.',
    'Focused on performance, API integrations, and pixel-perfect UI.',
  ];

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
    NavItem(label: 'Blog', sectionId: 'blog'),
    NavItem(label: 'Services', sectionId: 'services'),
    NavItem(label: 'Contact', sectionId: 'contact'),
  ];

  static const socials = <SocialLink>[
    SocialLink(
      label: 'LinkedIn',
      url: linkedinUrl,
      icon: Icons.work_outline,
    ),
  ];

  /// Stats aligned with CV positioning (no inflated project counts).
  static const stats = <StatItem>[
    StatItem(value: '4+', label: 'Years Experience'),
    StatItem(value: '10+', label: 'Projects'),
    StatItem(value: '5+', label: 'Happy Clients'),
    StatItem(value: 'Android', label: 'iOS & Web'),
  ];

  static const aboutHighlights = <StatItem>[
    StatItem(value: '4+', label: 'Years Experience'),
    StatItem(value: '10+', label: 'Projects'),
    StatItem(value: '5+', label: 'Happy Clients'),
    StatItem(value: 'Android', label: 'iOS & Web'),
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
      icon: Icons.phone_android,
    ),
    ServiceItem(
      title: 'API Integration',
      description:
          'Secure REST integrations, auth flows, and reliable data handling between app and backend.',
      icon: Icons.hub_outlined,
    ),
    ServiceItem(
      title: 'Firebase Development',
      description:
          'Auth, Firestore, FCM, Storage and the Firebase pieces that keep a product live.',
      icon: Icons.local_fire_department_outlined,
    ),
    ServiceItem(
      title: 'UI Implementation',
      description:
          'Responsive, pixel-accurate Flutter interfaces that stay smooth under real usage.',
      icon: Icons.design_services_outlined,
    ),
    ServiceItem(
      title: 'App Deployment',
      description:
          'Play Store, App Store and Web releases — builds, signing and release hygiene.',
      icon: Icons.rocket_launch_outlined,
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

  static const blogPosts = <BlogPost>[
    BlogPost(
      title: 'Clean Architecture in Flutter Without Over-Engineering',
      excerpt:
          'How I structure Flutter apps so features stay testable as the product grows — without drowning the team in folders.',
      date: 'Aug 2026',
      readTime: '6 min read',
      tags: ['Flutter', 'Architecture'],
    ),
    BlogPost(
      title: 'GetX vs Provider: Choosing State for Production Apps',
      excerpt:
          'A practical take on when GetX or Provider fits better for shipping Android and iOS clients under real deadlines.',
      date: 'Jul 2026',
      readTime: '5 min read',
      tags: ['Flutter', 'State Management'],
    ),
    BlogPost(
      title: 'Shipping Store-Ready Flutter Builds Faster',
      excerpt:
          'Release checklist notes for Play Store and App Store — signing, flavors, and the mistakes that slow teams down.',
      date: 'Jun 2026',
      readTime: '4 min read',
      tags: ['Deployment', 'Mobile'],
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
      slug: 'biz-hub',
      name: 'Biz Hub',
      category: 'Business Management',
      summary:
          'Flutter business operations hub for managing day-to-day company workflows on Android and iOS.',
      technologies: ['Flutter', 'Dart', 'GetX', 'REST API', 'Clean Architecture'],
      features: [
        'Dashboard and operational modules',
        'REST API integration',
        'Auth-aware sessions',
        'Android & iOS delivery',
      ],
      accent: AppColors.primary,
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'Biz Hub is a cross-platform Flutter client for business management workflows.',
        problem:
            'Teams needed a single mobile app for core business operations without jumping between tools.',
        solution:
            'A modular Flutter client with Clean Architecture, REST API integration, and role-aware operational screens.',
        myRole: 'Flutter Developer',
        myContribution:
            'YOUR_MY_CONTRIBUTION — architecture, feature modules, API layer, and UI.',
        keyFeatures: [
          'Dashboard and operational modules',
          'REST API integration',
          'Auth-aware sessions',
          'Android & iOS delivery',
        ],
        technologies: ['Flutter', 'Dart', 'GetX', 'REST API', 'Clean Architecture'],
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
      slug: 'audit-tracker',
      name: 'Audit Tracker 24/7',
      category: 'Enterprise Finance & Audit · Flutter',
      summary:
          'Enterprise-grade Flutter financial, accounting, and auditing management system for sales, expenses, inventory, assets, and real-time audit reporting.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'State Management',
      ],
      features: [
        'Sales, purchases, expenses, assets and liabilities',
        'Multi-company and client switching',
        'Product & inventory with stock monitoring',
        'Analytics dashboards and audit reports',
        'Subscription and membership controls',
      ],
      accent: AppColors.accent,
      screenshotAsset: 'assets/images/audit-tracker.png',
      galleryAssets: [
        'assets/images/audit-tracker.png',
      ],
      caseStudy: ProjectCaseStudy(
        overview:
            'Audit Tracker 24/7 is an enterprise-grade mobile financial, accounting, and auditing management system built with Flutter. Designed for businesses, auditors, and financial managers, the app streamlines complex operations including sales tracking, expense management, inventory, asset management, and real-time audit reporting through an intuitive interface.',
        problem: '',
        solution: '',
        myRole: '',
        myContribution: '',
        keyFeatures: [
          'Financial & Accounting Management — Sales, Purchases, Expenses, Assets, and Liabilities tracking with real-time balance calculations',
          'Multi-Company & Client Support — add, manage, and switch between multiple companies, active clients, and subscription levels within a single account',
          'Product & Inventory System — product categories, product lists, and service offerings with price and stock monitoring',
          'Analytics & Summary Reports — financial summaries, transaction insights, and detailed audit reports',
          'Subscription & Membership Controls — in-app management for subscription plans, active client memberships, and renewal tracking',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
          'State Management',
        ],
        architecture:
            'Cross-Platform Mobile App: Built using Flutter to deliver a reliable, secure, and cross-platform experience (iOS & Android) with high performance for handling dense data workflows.\n\nREST API Integration: Fully integrated with secure RESTful APIs to sync real-time financial transactions, multi-company ledger balances, inventory logs, and audit trails.\n\nScalable State Management: Engineered with clean state management patterns to efficiently handle dynamic forms, multi-category listings, and real-time data calculations.',
        challenges: [],
        results: '',
        screenshotNotes: '',
        links: [],
      ),
    ),
    Project(
      slug: 'khaleej-properties-mobile',
      name: 'Khaleej Properties – Mobile App',
      category: 'Real Estate · Flutter',
      summary:
          'A modern, full-featured real estate mobile app built with Flutter — connecting buyers, tenants, and agents through a clean, intuitive, and responsive UI.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'Clean Architecture',
        'State Management',
      ],
      features: [
        'Secure authentication with OTP and password recovery',
        'Dynamic property discovery with advanced filters & search',
        'Image galleries, maps, specs and pricing details',
        'Agent contact, visit scheduling and inquiries',
        'Favorites, booking requests and push notifications',
      ],
      accent: AppColors.success,
      screenshotAsset: 'assets/images/khaleej-properties-app.png',
      galleryAssets: [
        'assets/images/khaleej-properties-app.png',
      ],
      caseStudy: ProjectCaseStudy(
        overview:
            'Khaleej Properties is a modern, full-featured Real Estate mobile application built using Flutter. Designed to deliver a seamless property discovery and booking experience, the app connects buyers, tenants, and real estate agents through a clean, intuitive, and responsive UI.',
        problem: '',
        solution: '',
        myRole: '',
        myContribution: '',
        keyFeatures: [
          'Secure Authentication — login, registration, OTP verification, and secure password recovery',
          'Dynamic Property Discovery — interactive listings with advanced filtering (price, location, category, property type) and smart search',
          'Rich Property Media & Details — high-resolution image galleries, embedded location maps, property specifications, and pricing breakdowns',
          'Agent & Inquiry Engagement — contact agents, schedule property visits, or submit inquiries',
          'Personalized User Dashboard — manage profiles, save favorites, track booking requests, and receive push notifications',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
          'Clean Architecture',
          'State Management',
        ],
        architecture:
            'Cross-Platform Excellence: Developed with Flutter for a performant, pixel-perfect experience on both iOS and Android from a single codebase.\n\nREST API Integration: Fully dynamic and driven by robust backend REST APIs for real-time data synchronization, property updates, and secure authentication.\n\nState Management & Clean Architecture: Built using scalable state management patterns to maintain a responsive interface, smooth navigation, and optimized API calls.',
        challenges: [],
        results: '',
        screenshotNotes: '',
        links: [],
      ),
    ),
    Project(
      slug: 'khaleej-properties-web',
      name: 'Khaleej Properties – Web Platform',
      category: 'Real Estate · Next.js + Rust',
      summary:
          'High-performance full-stack real estate web app — Next.js frontend with Rust REST APIs for fast, SEO-friendly property search and listings.',
      technologies: [
        'Next.js',
        'Rust',
        'REST API',
        'SSR / SSG',
        'SEO',
      ],
      features: [
        'SSR/SSG property pages optimized for SEO',
        'Advanced multi-tier search and filtering',
        'Photo galleries and interactive location maps',
        'Auth, profiles and saved/favorite properties',
        'Agent inquiries, visit requests and messaging',
      ],
      accent: Color(0xFF2F9E7F),
      screenshotAsset: 'assets/images/khaleej-properties-web.png',
      galleryAssets: [
        'assets/images/khaleej-properties-web.png',
      ],
      caseStudy: ProjectCaseStudy(
        overview:
            'Khaleej Properties is a high-performance, full-stack real estate web application built to deliver a seamless property search and listing experience. Designed with a modern, responsive user interface, the platform connects buyers, tenants, and property managers through an ultra-fast, data-driven web environment.',
        problem: '',
        solution: '',
        myRole: '',
        myContribution: '',
        keyFeatures: [
          'SEO-Optimized Property Showcase — dynamic routing and server-rendered property pages for search indexing and organic discoverability',
          'Advanced Search & Filtering Engine — multi-tier filters (location, price range, property types, amenities, rent vs buy)',
          'Interactive Media Galleries & Maps — high-resolution photo galleries, interactive location maps, and property detail breakdowns',
          'User Onboarding & Management — registration, authentication, password recovery, profile customization, and saved/favorite properties',
          'Lead Generation & Contact Workflow — contact agents, submit visit requests, and send direct messages',
        ],
        technologies: [
          'Next.js',
          'Rust',
          'REST API',
          'SSR / SSG',
          'SEO',
        ],
        architecture:
            'Frontend: Next.js for SSR (Server-Side Rendering) and SSG (Static Site Generation), delivering fast page loads, optimal performance, and superior SEO visibility for property listings.\n\nBackend: Powered by high-performance Rust REST APIs, ensuring memory safety, low latency, and high concurrency for heavy traffic and complex property database queries.\n\nAPI Integration: Asynchronous API consumption connecting the Next.js frontend with the Rust backend for real-time data flow.',
        challenges: [],
        results: '',
        screenshotNotes: '',
        links: [],
      ),
    ),
    Project(
      slug: 'coinszar',
      name: 'Coinszar',
      category: 'Crypto / Fintech',
      summary:
          'Crypto-focused mobile experience for wallets, balances, and market-related flows.',
      technologies: ['Flutter', 'Dart', 'REST API', 'Secure Storage', 'GetX'],
      features: [
        'Wallet and balance views',
        'Auth-aware sessions',
        'Market-related screens',
        'Secure API integration',
      ],
      accent: Color(0xFF5B8DEF),
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'Coinszar is a Flutter crypto client for wallet balances and market-related product flows.',
        problem:
            'Users needed a stable Flutter client for crypto wallet and market interactions.',
        solution:
            'Secure auth-aware flows, wallet/balance screens, and API integrations for crypto product features.',
        myRole: 'Flutter Developer',
        myContribution:
            'YOUR_MY_CONTRIBUTION — wallet screens, auth flows, and API layer.',
        keyFeatures: [
          'Wallet and balance views',
          'Auth-aware sessions',
          'Market-related screens',
          'Secure API integration',
        ],
        technologies: ['Flutter', 'Dart', 'REST API', 'Secure Storage', 'GetX'],
        architecture:
            'Secure session handling and module split. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'YOUR_CHALLENGE_1',
          'YOUR_CHALLENGE_2',
        ],
        results: 'YOUR_RESULTS — production crypto client features shipped.',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
        ],
      ),
    ),
    Project(
      slug: 'pocket-khata',
      name: 'Pocket Khata',
      category: 'Personal Finance / Ledger',
      summary:
          'Personal and small-business ledger app for tracking daily money in and out.',
      technologies: ['Flutter', 'Dart', 'Hive', 'SQLite', 'Provider'],
      features: [
        'Income and expense tracking',
        'Transaction history and summaries',
        'Local / synced data storage',
        'Simple, fast Flutter UX',
      ],
      accent: AppColors.primary,
      liveUrl: 'YOUR_PROJECT_LIVE_URL',
      repoUrl: 'YOUR_PROJECT_REPO_URL',
      caseStudy: ProjectCaseStudy(
        overview:
            'Pocket Khata is a Flutter ledger for everyday income and expense tracking.',
        problem:
            'Users needed a simple mobile khata to record transactions without spreadsheet complexity.',
        solution:
            'A Flutter ledger with transaction entry, summaries, and local/API-backed persistence.',
        myRole: 'Flutter Developer',
        myContribution:
            'YOUR_MY_CONTRIBUTION — ledger flows, persistence, and UI.',
        keyFeatures: [
          'Income and expense tracking',
          'Transaction history and summaries',
          'Local / synced data storage',
        ],
        technologies: ['Flutter', 'Dart', 'Hive', 'SQLite', 'Provider'],
        architecture:
            'Data layer with transaction models. YOUR_ARCHITECTURE_DETAILS',
        challenges: [
          'YOUR_CHALLENGE_1',
          'YOUR_CHALLENGE_2',
        ],
        results: 'YOUR_RESULTS — usable day-to-day khata experience.',
        links: [
          ProjectLink(label: 'Live / Store', url: 'YOUR_PROJECT_LIVE_URL'),
        ],
      ),
    ),
    Project(
      slug: 'hope30',
      name: 'Hope30 – Smart Health & IoT Fitness Platform',
      category: 'Health · IoT · Flutter',
      summary:
          'Advanced Flutter health and lifestyle app with real-time IoT device sync, biometric analytics, wellness plans, and Firebase-backed auth.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Bluetooth / IoT SDK',
        'REST API',
      ],
      features: [
        'IoT sync for weight, body fat %, muscle mass and BMI',
        'Interactive charts and progress reports',
        'Firebase auth with email / phone OTP',
        'Nutrition, water, calories and step goals',
        'Subscriptions, history and notifications',
      ],
      accent: AppColors.accent,
      screenshotAsset: 'assets/images/hope30.png',
      galleryAssets: [
        'assets/images/hope30.png',
      ],
      caseStudy: ProjectCaseStudy(
        overview:
            'Hope30 is an advanced health and lifestyle management application engineered with Flutter. It combines real-time IoT hardware connectivity with modern health analytics, allowing users to track essential body composition metrics, monitor fitness goals, and follow structured daily wellness plans.',
        problem: '',
        solution: '',
        myRole: '',
        myContribution: '',
        keyFeatures: [
          'IoT Hardware Data Syncing — real-time acquisition from smart devices for body weight, body fat %, muscle mass, and BMI',
          'Biometric & Health Analytics — interactive charts, trend graphs, and progress reports for daily, weekly, and monthly transformations',
          'Secure Onboarding & Authentication — multi-factor verification, social log-ins, and password management via Firebase',
          'Custom Nutrition & Workout Logs — personalized daily goals for water intake, caloric limits, and step counts',
          'Subscriptions & History — membership plans, session histories, and personalized notifications',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'Bluetooth / IoT SDK',
          'REST API',
        ],
        architecture:
            'Cross-Platform Mobile App: Built with Flutter for a high-performance, responsive UI across iOS and Android.\n\nBackend & Authentication: Powered by Firebase for real-time data sync, push notifications, and secure user authentication (Email/Phone OTP).\n\nHardware & IoT Integration: Integrated custom SDKs via Bluetooth/Wireless connectivity to connect directly with smart health devices (e.g., Smart Scales, Body Composition Monitors) for automated weight and biometric data syncing.\n\nREST APIs: Seamless consumption of RESTful APIs to sync historical fitness logs, nutrition plans, and user subscription data.',
        challenges: [],
        results: '',
        screenshotNotes: '',
        links: [],
      ),
    ),
    Project(
      slug: 'achieve-it-app',
      name: 'Achieve It – Personal Goal & Daily Habit Tracker',
      category: 'Productivity · Flutter',
      summary:
          'Intuitive Flutter productivity and habit-tracking app to set personal goals, break them into daily targets, and track progress with visual logs.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'Clean Architecture',
        'State Management',
      ],
      features: [
        'Interactive dashboard with plans and progress rings',
        'Daily, weekly and monthly goal management',
        'Circular progress indicators and analytics',
        'Daily activity records and history logs',
        'Onboarding, sign-in and OTP password reset',
      ],
      accent: AppColors.success,
      screenshotAsset: 'assets/images/achieve-it.png',
      galleryAssets: [
        'assets/images/achieve-it.png',
      ],
      caseStudy: ProjectCaseStudy(
        overview:
            'Achieve It is an intuitive productivity and habit-tracking mobile application designed to help users set personal goals, break them down into actionable daily targets, and track their progress over time. Built with a clean UI, the app focuses on driving consistency through visual progress tracking and daily activity logs.',
        problem: '',
        solution: '',
        myRole: '',
        myContribution: '',
        keyFeatures: [
          'Interactive Dashboard — dynamic home view with daily action plans, monthly target widgets, and overall progress rings',
          'Goal & Target Management — create and customize daily, weekly, or monthly goals (e.g., reading books, running, skill learning)',
          'Progress Tracking & Analytics — circular progress indicators, detailed goal breakdown screens, and progress logs',
          'Daily Activity Records & History — record daily milestones, update activity entries, and track long-term performance',
          'User Authentication & Onboarding — onboarding screens, sign-in/sign-up flows, and OTP-based password reset',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
          'Clean Architecture',
          'State Management',
        ],
        architecture:
            'Cross-Platform Mobile App: Built using Flutter for responsive, cross-platform performance on both iOS and Android.\n\nREST API Integration: Fully integrated with RESTful APIs to sync user goals, activity records, progress percentages, and user profiles in real time.\n\nState Management: Engineered with clean architecture to handle dynamic updates across dashboards, goal progress metrics, and daily history logs.',
        challenges: [],
        results: '',
        screenshotNotes: '',
        links: [],
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
