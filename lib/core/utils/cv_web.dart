import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:web/web.dart' as web;

import '../../data/portfolio_data.dart';

/// Opens / downloads the CV on Flutter Web.
///
/// Prefer the public `./cv.pdf` next to the site (GitHub Pages friendly).
/// Fall back to loading `assets/cv.pdf` as a blob if needed.
Future<void> openCvAsset() async {
  final publicHref = Uri.base.resolve(PortfolioData.cvUrl).toString();

  try {
    final data = await rootBundle.load(PortfolioData.cvAssetPath);
    final bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    final blob = web.Blob(
      [bytes.toJS].toJS,
      web.BlobPropertyBag(type: 'application/pdf'),
    );
    final objectUrl = web.URL.createObjectURL(blob);
    _clickDownload(objectUrl);
    Future<void>.delayed(const Duration(seconds: 2), () {
      web.URL.revokeObjectURL(objectUrl);
    });
  } catch (_) {
    _clickDownload(publicHref);
  }
}

void _clickDownload(String href) {
  final anchor = web.HTMLAnchorElement()
    ..href = href
    ..download = PortfolioData.cvDownloadFileName
    ..target = '_blank'
    ..rel = 'noopener';

  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
