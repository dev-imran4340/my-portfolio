import 'package:url_launcher/url_launcher.dart';

import '../../data/portfolio_data.dart';

/// Non-web fallback: open the public CV path relative to the site base.
Future<void> openCvAsset() async {
  final uri = Uri.base.resolve(PortfolioData.cvUrl);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
