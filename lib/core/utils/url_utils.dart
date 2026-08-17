import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(BuildContext context, String url) async {
  if (_isPlaceholder(url)) {
    _notify(context, 'Update this link in lib/data/portfolio_data.dart');
    return;
  }

  final uri = Uri.tryParse(url);
  if (uri == null) {
    _notify(context, 'Invalid URL');
    return;
  }

  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched && context.mounted) {
    _notify(context, 'Could not open link');
  }
}

Future<void> openEmail(BuildContext context, String email) async {
  if (_isPlaceholder(email)) {
    _notify(context, 'Update your email in lib/data/portfolio_data.dart');
    return;
  }
  await openExternalUrl(context, 'mailto:$email');
}

bool _isPlaceholder(String value) {
  return value.contains('[') ||
      value.contains('YOUR_') ||
      value.trim().isEmpty ||
      value == '#';
}

void _notify(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
